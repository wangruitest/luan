package com.funo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class CommonAction {

	public SysOperator getSessionUser(){
		HttpSession session = CommonMethod.filtDwrSession(null);
		SysOperator result=new SysOperator();
		result=(SysOperator)session.getAttribute(Constants.Session_Attribute_UserEnv);
		return result;
	}
	
	public HttpServletRequest getHttpRequest(){
		HttpServletRequest request=CommonMethod.filtDwrRequest(null);
		return request;
	}
}
