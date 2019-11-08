package com.funo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContextFactory;

public class CommonMethod {

	/**
     * 如果session==null，则取dwr的session
    *
    * @param s - session
    * @return HttpSession - session
    */
	public static HttpSession filtDwrSession(HttpSession s){
		if(s==null){
			s = WebContextFactory.get().getSession();
		}
		return s;
	}
	
	/**
     * 如果HttpServletRequest==null，则取dwr的HttpServletRequest
    *
    * @param s - HttpServletRequest
    * @return HttpServletRequest - HttpServletRequest
    */
	public static HttpServletRequest filtDwrRequest(HttpServletRequest r){
		if(r==null){
			r = WebContextFactory.get().getHttpServletRequest();
		}
		return r;
	}
	
}
