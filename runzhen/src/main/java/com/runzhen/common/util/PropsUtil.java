package com.runzhen.common.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropsUtil {
	
	/**
	 * 加载属性文件
	*/
	public static Properties loadProps(String fileName){
		Properties props = null;
		InputStream is = null;
		try{
			is = Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);
			if(is == null){
				throw new FileNotFoundException(fileName+" file is not found");
			}
			props = new Properties();
			props.load(is);
		} catch(IOException e){
			e.printStackTrace();
		} finally{
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return props;
	}
	
	/**
	 * 获取字符型属性(可指定默认值)
	*/
	public static String getString(Properties props,String key,String defaultValue){
		String value = defaultValue;
		if(props.containsKey(key)){
			value = props.getProperty(key);
		}
		
		return value;
	}
	
	/**
	 * 获取字符型属性(可指定默认值)
	*/
	public static String getString(Properties props,String key){
		return getString(props, key, "");
	}
}
