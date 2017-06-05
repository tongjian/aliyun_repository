package com.runzhen.common.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReflectionUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(ReflectionUtil.class);
	
	/**
	 * 创建实例
	*/
	public static Object newInstance(Class<?> cls){
		Object instance;
		try {
			instance = cls.newInstance();
		} catch (Exception e) {
			LOGGER.error("new instance failure",e);
			throw new RuntimeException(e);
		} 
		
		return instance;
	}
	
	/**
	 * 调用方法
	*/
	public static Object invokeMethod(Object obj,Method method,Object...args){
		Object result;
		try {
			method.setAccessible(true);
			result = method.invoke(obj, args);
		} catch (IllegalAccessException | IllegalArgumentException
				| InvocationTargetException e) {
			LOGGER.error("invoke method failure",e);
			throw new RuntimeException(e);
		}
		return result;
	}
}
