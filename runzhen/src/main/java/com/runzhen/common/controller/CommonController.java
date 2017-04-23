package com.runzhen.common.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CommonController {

	private static final Log logger = LogFactory.getLog(CommonController.class);
	
	/*
	 * 功能：页面跳转
	*/
	@RequestMapping("/forward")
	public String forward(String page){
		logger.info("common-forward:"+page);
		return page;
	}
}
