package com.funo.mobile;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.funo.mobile.servlets.ServletController;
import com.funo.mobile.utils.ServletUtils;
import com.google.gson.Gson;

public class ProcessServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.process(req, resp);
	}

	
	
	private void  process(HttpServletRequest req, HttpServletResponse resp){
		try{
			ServletController controller = new ServletController();
			Map<String,Object> result = controller.execute(req, resp);
			
			Gson gson = new Gson();
			String jsonStr = gson.toJson(result);
			//JSONObject解析linkedHashMap的顺序有错
//			String jsonStr = JSONObject.fromMap(result).toString();
			ServletUtils.outputJson(jsonStr, req, resp, null);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	
}
