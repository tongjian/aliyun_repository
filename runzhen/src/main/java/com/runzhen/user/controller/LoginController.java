package com.runzhen.user.controller;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;
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
			return UserConstant.STATUS_REGISTER_ERROR;
		}
		
		List<UserInfo> userList = userInfoService.findByInfo(userInfo);
		if(CollectionUtils.isEmpty(userList)){
			return UserConstant.STATUS_REGISTER_USER_ESISTS;
		}
		
		userInfo.setCreateDate(new Date());
		int result = userInfoService.insert(userInfo);
		logger.info("register-result:"+result);
		return UserConstant.STATUS_REGISTER_SUCCESS;
	}
	
	@RequestMapping("/login")
	public String login(UserInfo userInfo){
		if(userInfo == null){
			return "error";
		}
		return "success";
	}
}
