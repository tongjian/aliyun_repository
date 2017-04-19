package com.runzhen.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

	private static final Log logger = LogFactory.getLog(DemoController.class);
	
//	@RequestMapping("/index")
	public String index(){
		logger.info("DemoController called");
		return "/bootstrap/starter";
//		return "demo";
	}

}
