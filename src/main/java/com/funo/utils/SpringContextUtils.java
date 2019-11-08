package com.funo.utils;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


public class SpringContextUtils implements ApplicationContextAware,
		DisposableBean {

	private static ApplicationContext applicationContext = null;
	
	@Override
	public void destroy() throws Exception {
		clear();
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringContextUtils.applicationContext  = applicationContext;
	}
	
	/***
	 * <p>
	 *	<b>describe:</b><br>
	 *	 清除上下文<br>
	 * </p>
	 * @author shijiansheng
	 */
	public static  void clear(){
		SpringContextUtils.applicationContext = null;
	}
	
	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	 提供外部获取Spring上下文的方法<br>
	 * </p>
	 * @return
	 * @author shijiansheng
	 */
	public static ApplicationContext getApplicationContext(){
		return applicationContext;
	}
	
	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	 根据beanName获取到对应的实例<br>
	 * </p>
	 * @param name
	 * @return
	 * @author shijiansheng
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String name){
		return (T) applicationContext.getBean(name);
	}


	/**
	 * <p>
	 *	<b>describe:</b><br>
	 *	根据类型获取到Bean的实例 <br>
	 * </p>
	 * @param requiredType
	 * @return
	 * @author shijiansheng
	 */
	public static <T> T getBean(Class<T> requiredType) {
		return applicationContext.getBean(requiredType);
	}
	
}
