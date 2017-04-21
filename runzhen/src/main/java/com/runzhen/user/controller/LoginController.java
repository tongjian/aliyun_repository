package com.runzhen.user.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String register(UserInfo userInfo){
		if(userInfo == null){
			return "error";
		}
		int result = userInfoService.insert(userInfo);
		logger.info("register-result:"+result);
		return "success";
	}
	
	@RequestMapping("/login")
	public String login(UserInfo userInfo){
		if(userInfo == null){
			return "error";
		}
		return "success";
	}
}
