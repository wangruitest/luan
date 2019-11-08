package com.funo.utils;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.impl.Log4JLogger;

import com.funo.attachment.FileManager;
import com.funo.common.CommonMethod;
import com.funo.system.model.SysOperator;
import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

/**
 * 系统文件下载Servlet
 * @author chenxifu@funo.com.cn
 *
 */
public class FileDownload extends HttpServlet
{

	/**
	 * 串行标识
	 */
	private static final long serialVersionUID = 1L;
	Log log=LogFactory.getLog(FileDownload.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		  HttpSession session = request.getSession();
		  String flagInSession=(String) session.getAttribute("downFlag");
		  Double   d1= Double.parseDouble(flagInSession);
		  String flagInRequest=request.getParameter("random");
		  Double   d2= Double.parseDouble(flagInRequest);
		  d2 = d2/21.9;//解密
		  DecimalFormat    df   = new DecimalFormat("######0.000000");  
		  String d3=df.format(d1); 
		  String d4=df.format(d2); 
		  //System.out.println("flagInSession="+d3+"....."+"flagInRequest="+d4);
		  SysOperator user = null;
		  try {
			user = ((SysOperator)session.getAttribute("UserEnv")==null?null:(SysOperator)session.getAttribute("UserEnv"));
		  } catch (Exception e) {
			  //request.getRequestDispatcher("../index/index.jsp").forward(request, response);
			  log.error("error");
		  } 
		  if(user==null) {
			  response.sendRedirect("../ahlyxxh/index/index.jsp");
			  return;
		  } else {
			  
		//获取完整文件路径地址
		String downloadFileName = new String(request.getParameter("downloadFileName").getBytes("ISO-8859-1"),"utf-8");
		String downloadMavenTemp=downloadFileName;
		//所属父级模块标识
		String punid = request.getParameter("punid");
		if(null!=downloadFileName){
			String basePath1=Constants.getAppPath()+Constants.FILE_SEPARATOR+Constants.ATTACHMENT_PATH+Constants.FILE_SEPARATOR;
			String basePath2=Constants.getAppPath()+Constants.FILE_SEPARATOR+"src"+Constants.FILE_SEPARATOR+"main"+
					Constants.FILE_SEPARATOR+"webapp"+Constants.FILE_SEPARATOR+Constants.ATTACHMENT_PATH+Constants.FILE_SEPARATOR;
			if(null!=punid){
				downloadFileName=basePath1+punid+Constants.FILE_SEPARATOR+downloadFileName;
				downloadMavenTemp=basePath2+punid+Constants.FILE_SEPARATOR+downloadFileName;
			}else{
				downloadFileName=basePath1+downloadFileName;
				downloadMavenTemp=basePath2+downloadMavenTemp;
			}
		}
		
		//文件名称
		String saveFileName  = new String(request.getParameter("saveFileName").getBytes("ISO-8859-1"),"gb2312");
		
		File file = new File(downloadFileName);
		log.warn("---------------------》普通的路径地址：《---------------------"+downloadFileName);
		File fileMaven=new File(downloadMavenTemp);
		log.warn("---------------------》Maven的路径地址：《---------------------"+downloadMavenTemp);
		if(file.isFile()){
			log.warn("---------------------》执行的路径地址：《---------------------"+file.getAbsolutePath());
			if(StringUtils.isEmpty(saveFileName))
				//文件名称,包括扩展名,(一串随机id)
				saveFileName = file.getName();
			//下载文件
			FileManager.downFile(saveFileName, downloadFileName, response);
		}else if(fileMaven.isFile()){
			log.warn("---------------------》执行的路径地址：《---------------------"+fileMaven.getAbsolutePath());
			if(StringUtils.isEmpty(saveFileName))
				//文件名称,包括扩展名,(一串随机id)
				saveFileName = file.getName();
			//下载文件
			FileManager.downFile(saveFileName, downloadMavenTemp, response);
		}else{
			response.getWriter().write("文件不存在或者不是文件11111");
			//response.getWriter()
		}
	 }			
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doGet(request, response);

	}
}
