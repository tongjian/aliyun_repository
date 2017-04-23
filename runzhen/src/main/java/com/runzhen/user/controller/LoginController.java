package com.runzhen.user.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String register(UserInfo userInfo){
		if(userInfo == null){
			return UserConstant.REGISTER_RESULT_ERROR;
		}
		
		UserInfo info = new UserInfo();
		info.setUserCode(userInfo.getUserCode());
		List<UserInfo> userList = userInfoService.findByInfo(info);
		if(!CollectionUtils.isEmpty(userList)){		//此用户已存在
			return UserConstant.REGISTER_RESULT_USER_ESISTS;
		}
		
		userInfo.setCreateDate(new Date());
		userInfo.setActive(UserConstant.USER_ACTIVITE_ON); 		//用户设为有效
		int result = userInfoService.insert(userInfo);
		logger.info("register-result:"+result);
		return UserConstant.REGISTER_RESULT_SUCCESS;
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(UserInfo userInfo,HttpSession httpSession){
		if(userInfo == null){
			return UserConstant.LOGIN_RESULT_ERROR;
		}
		
		UserInfo info = new UserInfo();
		info.setUserCode(userInfo.getUserCode());
		List<UserInfo> userList = userInfoService.findByInfo(info);
		if(CollectionUtils.isEmpty(userList)){
			return UserConstant.LOGIN_RESULT_USER_NOT_ESISTS;		//用户不存在
		}else if(userList.size() > 1){
			return UserConstant.LOGIN_RESULT_EXCEPTION;				//存在多个相同用户，显示“登录异常”
		}else{		//userList == 1;正确 
			String password = userList.get(0).getPassword();
			if(!password.equalsIgnoreCase(userInfo.getPassword())){
				//密码不正确
				return UserConstant.LOGIN_RESULT_PASSWORD_NOT_CORRECT;
			}
			
			httpSession.setAttribute("userCode", userList.get(0).getUserCode());
			return UserConstant.RESULT_SUCCESS;		//登录成功
		}
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpSession httpSession){
		httpSession.invalidate();
		return UserConstant.RESULT_SUCCESS;
	}
}
