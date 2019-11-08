package com.funo.mobile.servlets;

import java.lang.reflect.Constructor;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class ServletController {

	private IServlet servlet;
	
	public ServletController(){
	}
	
	/**
	 * 创建servlet的执行函数
	 * @param servletName
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public IServlet getServlet(String servletName,HttpServletRequest request,HttpServletResponse response){

		try{
			String className = "com.funo.mobile.servlets.sub."+StringUtils.capitalize(servletName) +"Servlet";
			Class<Servlet>  clazz = (Class<Servlet>) Class.forName(className);
			if (clazz != null) {
				Constructor<Servlet> constructor=clazz.getDeclaredConstructor(new Class[]{});   
				constructor.setAccessible(true);   
				servlet = (IServlet) constructor.newInstance(new Object[]{});
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return servlet;
	}
	
	public Map<String,Object> execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		servlet  = getServlet(request.getParameter("servlet"), request, response);
		return servlet.execute(request,response);
	}
	
}
