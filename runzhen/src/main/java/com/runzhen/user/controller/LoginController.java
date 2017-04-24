package com.runzhen.user.controller;

import java.util.Date;
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
				resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
				resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGIN_RESULT_SUCCESS);		//登录成功
			}
		}
		return resultMap;		
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public Map<String,String> logout(HttpSession httpSession){
		Map<String,String> resultMap = CommonUtil.getReturnMap();
		httpSession.invalidate();
		
		resultMap.put(CommonUtil.RESULT_CODE, CommonUtil.RESULT_STATUS_SUCCESS);
		resultMap.put(CommonUtil.RESULT_MESSAGE, UserConstant.LOGOUT_RESULT_SUCCESS);		//注销成功
		return resultMap;
	}
}
