package com.runzhen.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 功能：自定义的拦截器
*/
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Log logger = LogFactory.getLog(LoginInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) 
			throws Exception { 
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String remoteAddr = request.getRemoteAddr();
		if(request.getSession().getAttribute("userCode") == null){
			response.sendRedirect("/runzhen/view/main.jsp");		//跳转到首页
		};
		logger.info("LoginInterceptor-preHandle-uri:"+uri);
		logger.info("LoginInterceptor-preHandle-contextPath:"+contextPath);
		logger.info("LoginInterceptor-preHandle-remoteAddr:"+remoteAddr);
		return true;
	}
}
