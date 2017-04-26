package com.runzhen.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.runzhen.common.util.CommonUtil;
import com.runzhen.user.UserConstant;
import com.runzhen.user.domain.UserInfo;
import com.runzhen.user.service.IUserInfoService;

@Controller
@RequestMapping("/user")
public class LoginController {
	
	private static final Log logger = LogFactory.getLog(LoginController.class);

	@Autowired
	private IUserInfoService userInfoService;
	
	/*
	 * 功能：注册
	*/
	@RequestMapping("/register")
	@ResponseBody
	public Map<String,String> register(UserInfo userInfo){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
		
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
			userInfo.setActive(UserConstant.USER_ACTIVITE_ON); 		//用户设为有效
			int result = userInfoService.insert(userInfo);
			logger.info("register-result:"+result);
			
			resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.REGISTER_RESULT_SUCCESS);
		}

		return resultMap;
	}
	
	/*
	 * 功能：登录
	*/
	@RequestMapping("/login")
	@ResponseBody
	public Map<String,String> login(UserInfo userInfo,HttpSession httpSession){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
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
	
	/*
	 * 功能：注销
	*/
	@RequestMapping("/logout")
	@ResponseBody
	public Map<String,String> logout(HttpSession httpSession){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
		httpSession.invalidate();
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGOUT_RESULT_SUCCESS);		//注销成功
		return resultMap;
	}
	
	/*
	 * 功能：显示用户列表
	*/
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getUserList(UserInfo record,int limit,int offset){
		Map<String,Object> result = new HashMap<String,Object>();
		List<UserInfo> userList = userInfoService.selectByPage(record);
		Integer total = userInfoService.getTotal(record);
		result.put("rows", userList);
		result.put("total", total);
		return result;
	}
	
	/*
	 * 功能：显示用户列表
	*/
	@RequestMapping("/findInfo")
	@ResponseBody
	public UserInfo findUserByUserCode(String userCode){
		UserInfo info = userInfoService.findUserByUserCode(userCode);
		return info;
	}
	
	/*
	 * 功能：显示用户列表
	 */
	@RequestMapping("/selectByPrimaryKey")
	@ResponseBody
	public UserInfo selectByPrimaryKey(Integer userId){
		UserInfo info = userInfoService.selectByPrimaryKey(userId);
		return info;
	}
	
	/*
	 * 功能：显示用户列表
	*/
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(UserInfo userInfo,HttpSession httpSession){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
		
		userInfo.setUpateDate(new Date());  		//设置修改时间
		userInfoService.updateByPrimaryKeySelective(userInfo);
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.UPDATE_RESULT_SUCCESS);		//修改成功
		return resultMap;
	}
	
	/*
	 * 功能：显示用户列表
	*/
	@RequestMapping("/changePassword")
	@ResponseBody
	public Map<String,String> changePassword(UserInfo userInfo,HttpSession httpSession){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
		
		UserInfo oldUserInfo = userInfoService.selectByPrimaryKey(userInfo.getUserId());
		String oldPassword = oldUserInfo.getPassword();
		if(oldPassword.equals(userInfo.getPassword())){
			userInfo.setPassword(userInfo.getNewPassword());			//将密码修改为新的密码
			userInfo.setUpateDate(new Date());  						//设置修改时间
			userInfoService.updateByPrimaryKeySelective(userInfo);
			
			httpSession.invalidate(); 		//修改密码后，要求重新登录

			resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.PASSWORD_UPDATE_RESULT_SUCCESS);		//修改成功
		}else{
			resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.PASSWORD_UPDATE_RESULT_ERROR);		//修改失败
		}
		
		return resultMap;
	}
}
