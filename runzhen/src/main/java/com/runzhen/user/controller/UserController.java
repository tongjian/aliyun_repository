package com.runzhen.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.common.util.CommonUtil;
import com.runzhen.common.util.ExcelUtil;
import com.runzhen.excel.ExcelConfigConstant;
import com.runzhen.excel.domain.ExcelConfigInfo;
import com.runzhen.excel.service.ExcelConfigService;
import com.runzhen.user.UserConstant;
import com.runzhen.user.domain.UserInfo;
import com.runzhen.user.domain.UserRole;
import com.runzhen.user.service.IUserInfoService;
import com.runzhen.user.service.IUserRoleService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Log logger = LogFactory.getLog(UserController.class);

	@Autowired
	private IUserInfoService userInfoService;
	@Autowired
	private IUserRoleService userRoleService;
	
	@Autowired
	private ExcelConfigService excelConfigService;			//excel导入导出配置
	
	/**
	 * 功能：注册
	*/
	@RequestMapping("/register")
	@ResponseBody
	public Map<String,Object> register(UserInfo userInfo){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		if(userInfo == null){
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.REGISTER_RESULT_ERROR);
			return resultMap;
		}
		
		UserInfo info = new UserInfo();
		info.setUserCode(userInfo.getUserCode());
		List<UserInfo> userList = userInfoService.findByInfo(info);			//查询用户列表
		if(!CollectionUtils.isEmpty(userList)){		//此用户已存在
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.REGISTER_RESULT_USER_ESISTS);
		}else{
			userInfo.setCreateDate(new Date());
			userInfo.setActive(UserConstant.ACTIVITE_ON); 		//用户设为有效
			int result = userInfoService.insert(userInfo);
			logger.info("register-result:"+result);
			
			resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.REGISTER_RESULT_SUCCESS);
		}

		return resultMap;
	}
	
	/**
	 * 功能：登录
	*/
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,Object> login(UserInfo userInfo,HttpSession httpSession){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		if(userInfo == null){
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_ERROR);
			return resultMap;
		}
		
		UserInfo info = new UserInfo();
		info.setUserCode(userInfo.getUserCode());
		List<UserInfo> userList = userInfoService.findByInfo(info);
		if(CollectionUtils.isEmpty(userList)){
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_USER_NOT_ESISTS);		//用户不存在
		}else if(userList.size() > 1){
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_EXCEPTION);				//登录异常
		}else{		//userList == 1;正确 
			String password = userList.get(0).getPassword();
			if(!password.equalsIgnoreCase(userInfo.getPassword())){
				//密码不正确
				resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_PASSWORD_NOT_CORRECT);	//密码不正确
			}else{
				httpSession.setAttribute("userCode", userList.get(0).getUserCode());
				httpSession.setAttribute("userId", userList.get(0).getUserId());
				resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
				resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_SUCCESS);		//登录成功
			}
		}
		return resultMap;		
	}
	
	/**
	 * 功能：注销
	*/
	@RequestMapping("/logout")
	@ResponseBody
	public Map<String,Object> logout(HttpSession httpSession){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		httpSession.invalidate();
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGOUT_RESULT_SUCCESS);		//注销成功
		return resultMap;
	}
	
	/**
	 * 功能：显示用户列表,分页查询
	*/
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getUserList(UserInfo record){
		Map<String,Object> result = new HashMap<String,Object>();
		List<UserInfo> userList = userInfoService.selectByPage(record);
		Integer total = userInfoService.getTotal(record);
		result.put("rows", userList);
		result.put("total", total);
		return result;
	}
	
	/**
	 * 功能：显示用户列表
	*/
	@RequestMapping("/findInfo")
	@ResponseBody
	public UserInfo findUserByUserCode(String userCode){
		UserInfo info = userInfoService.findUserByUserCode(userCode);
		return info;
	}
	
	/**
	 * 功能：根据userId查询用户
	 */
	@RequestMapping("/selectByPrimaryKey")
	@ResponseBody
	public Map<String,Object> selectByPrimaryKey(Integer userId){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		UserInfo info = userInfoService.selectByPrimaryKey(userId);
		
		UserRole userRole = new UserRole();
		userRole.setActive(UserConstant.ACTIVITE_ON);
		userRole.setUserId(String.valueOf(userId));
		List<Integer> roleIds = userRoleService.findRoleIdsByInfo(userRole);
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(UserConstant.USERINFO, info);
		resultMap.put(UserConstant.ROLEIDS, roleIds);
		return resultMap;
	}
	
	/**
	 * 功能：修改用户信息
	*/
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,Object> update(UserInfo userInfo,@RequestParam(value = "roleIds[]") Integer[] roleIds,HttpSession httpSession){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		if(userInfo == null || userInfo.getUserId() == null){
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.UPDATE_RESULT_ERROR);
			return resultMap;
		}
		
		//修改用户基本信息
		userInfo.setUpdateDate(new Date());  		//设置修改时间
		userInfoService.updateByPrimaryKeySelective(userInfo);
		
		//修改用户的角色配置
		if(roleIds != null){
			userRoleService.changeUserRoleReleative(userInfo,roleIds,httpSession);
		}
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.UPDATE_RESULT_SUCCESS);		//修改成功
		return resultMap;
	}
	
	/**
	 * 功能：修改密码
	*/
	@RequestMapping("/changePassword")
	@ResponseBody
	public Map<String,Object> changePassword(UserInfo userInfo,HttpSession httpSession){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		UserInfo oldUserInfo = userInfoService.selectByPrimaryKey(userInfo.getUserId());
		String oldPassword = oldUserInfo.getPassword();
		if(oldPassword.equals(userInfo.getPassword())){
			userInfo.setPassword(userInfo.getNewPassword());			//将密码修改为新的密码
			userInfo.setUpdateDate(new Date());  						//设置修改时间
			userInfoService.updateByPrimaryKeySelective(userInfo);
			
			httpSession.invalidate(); 		//修改密码后，要求重新登录

			resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.PASSWORD_UPDATE_RESULT_SUCCESS);		//修改成功
		}else{
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.PASSWORD_UPDATE_RESULT_ERROR);		//修改失败
		}
		
		return resultMap;
	}
	
	/**
	 * 功能：删除用户，用户置为失效，不做物理删除
	*/
	@RequestMapping("/deleteUser")
	@ResponseBody
	public Map<String,Object> deleteUser(Integer userId){
		Map<String,Object> resultMap = CommonUtil.getReturnMap();
		
		UserInfo info = new UserInfo();
		info.setUserId(userId);
		info.setActive(UserConstant.ACTIVITE_OFF);
		userInfoService.updateByPrimaryKeySelective(info);
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.DELETE_USER_RESULT_SUCCESS);		//修改成功
		return resultMap;
	}
	
	/**
	 * 功能：导出excel文件
	 * @throws Exception 
	*/
	@RequestMapping(value="/exportUserList")
	public String exportUserList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String fileName = "用户列表.xls";
		
    	ExcelConfigInfo excelConfigInfo = new ExcelConfigInfo();
    	excelConfigInfo.setExcelFileCode("userinfo");
    	excelConfigInfo.setExportFlag(ExcelConfigConstant.EXPORT_FLALG_Y);
    	List<ExcelConfigInfo> excelConfigList = excelConfigService.findAll(excelConfigInfo);
    	
//		String[] attributes = new String[]{"userCode","userName","email","phoneNumber","remark"};
//		String[] colNames = new String[]{"用户编号","用户名","邮箱","电话","备注"};
		
		List<UserInfo> userList = userInfoService.findByInfo(new UserInfo());		//获取所有用户
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		for(UserInfo info : userList){
			Map<String,Object> dataMap = new HashMap<String,Object>();
			dataMap.put("userCode", info.getUserCode());
			dataMap.put("userName", info.getUserName());
			dataMap.put("email", info.getEmail());
			dataMap.put("phoneNumber", info.getPhoneNumber());
			dataMap.put("remark", info.getRemark());
			dataMap.put("birthDate", info.getBirthDate());
			dataMap.put("createDate", info.getCreateDate());
			
			dataList.add(dataMap);
		}
		
		new ExcelUtil().exportExcelFile(fileName, excelConfigList, dataList, response);
//		new ExcelUtil().downloadExcelFile(fileName,attributes, colNames, dataList, response);
		
		return null;
	}
}
