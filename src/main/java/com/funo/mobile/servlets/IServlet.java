package com.funo.mobile.servlets;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IServlet {
	public Map<String,Object> execute(HttpServletRequest req,HttpServletResponse response) throws Exception;
}
