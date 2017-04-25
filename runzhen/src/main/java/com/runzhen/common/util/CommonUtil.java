package com.runzhen.common.util;

import java.util.HashMap;
import java.util.Map;

public class CommonUtil {
	
	public static String RESULT_CODE = "resultCode";
	public static String RESULT_STATUS_SUCCESS = "success";
	public static String RESULT_STATUS_ERROR = "error";
	public static String RESULT_MESSAGE = "resultMessage";
	
	private static Map<String,String> returnMap;
	
	//前端请求返回Map,默认返回失败
	public static Map<String,String> getReturnMap(){
		if(returnMap == null){			//防止创建多个对象
			returnMap = new HashMap<String,String>();
			returnMap.put(RESULT_CODE, RESULT_STATUS_ERROR);
			returnMap.put(RESULT_MESSAGE, "");
		}else{
			returnMap.clear();
		}
		
		return returnMap;
	}
}
