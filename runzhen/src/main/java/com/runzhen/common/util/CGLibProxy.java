package com.runzhen.common.util;

import java.lang.reflect.Method;

import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import com.runzhen.common.util.test.Hello;
import com.runzhen.common.util.test.HelloImpl;

public class CGLibProxy implements MethodInterceptor {

	private static CGLibProxy instance = new CGLibProxy();
	
	private CGLibProxy(){
		
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getProxy(Class<T> cls){
		return (T) Enhancer.create(cls, this);
	}
	
	public static CGLibProxy getInstance(){
		return instance;
	}
	
	@Override
	public Object intercept(Object obj, Method method, Object[] args,
			MethodProxy proxy) throws Throwable {
		// TODO Auto-generated method stub
		before();
		Object result = proxy.invokeSuper(obj, args);
		after();
		return result;
	}

	public void before(){
		System.out.println("before:");
	}
	
	public void after(){
		System.out.println("after:");
	}
	
	public static void main(String[] args) {
		Hello helloProxy = CGLibProxy.getInstance().getProxy(HelloImpl.class);
		helloProxy.say("Jack");
	}

}
