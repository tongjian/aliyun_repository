package com.runzhen.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 功能：自定义的拦截器
*/
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) 
			throws Exception { 
		if(request.getSession().getAttribute("userCode") == null){
			response.sendRedirect("/runzhen/view/main.jsp");		//跳转到首页
		};
		return true;
	}
}
