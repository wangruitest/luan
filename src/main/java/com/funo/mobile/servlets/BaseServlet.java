package com.funo.mobile.servlets;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.funo.mobile.MobileConstants;

public abstract class BaseServlet implements IServlet  {

	public abstract Map<String,Object>  process(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	/**
	 * 实际执行函数<br>
	 * 需要返回结果集合 <code>Map</code>
	 */
	public Map<String,Object> execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			String userId = request.getParameter("userId");
			if(StringUtils.isBlank(userId)){
				result.put(MobileConstants.RESULT_CODE, MobileConstants.FAIL_CODE);
				result.put("result", false);
				result.put("msg", "用户未登录!");
				return result;
			}
		    result = this.process(request, response);
		}catch(Exception ex){
			ex.printStackTrace();
			result.put(MobileConstants.RESULT_CODE, MobileConstants.FAIL_CODE);
			result.put("result", false);
			result.put("msg", "系统异常!");
		}
		
		return result;
	}

}
