<%@ page contentType="text/html;charset=gb2312" %>
  <%@ page language="java" %>
  <%@ page import="java.text.*" %>   
  <%@ page import="java.util.*" %>   
  <%@ page import="java.io.*" %>
  <%@ page import="java.net.*" %>
  <%@ page import="uk.ltd.getahead.dwr.WebContext"%>
  <%@ page import="javax.servlet.http.HttpServletResponse"%>
  <%@ page import="java.net.URL"%>
  <%@ page import="java.net.URLConnection"%>
  <%@ page import="com.funo.report.ExportExcelReport"%>
  
  <html>
  <head>
  <title>
  test_12
  </title>
  </head>
  <body>
<%
String fileName=request.getParameter("fileName");
String filePath=request.getParameter("filePath");
String fileNameOld = fileName;
URL url = new URL("" + request.getRequestURL() + "");
String urlnew = "http://" + url.getHost() + ":"+ url.getPort() + request.getContextPath() +"/temp/";
url = new URL(urlnew + fileName + ".xls");
try{

	response.reset();       
	response.setContentType("application/vnd.ms-excel");
	String filedisplay = fileName + ".xls";    
	filedisplay = URLEncoder.encode(filedisplay,"UTF-8"); 
	response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);
	java.io.OutputStream outp = null;
	java.io.BufferedInputStream in = null;
	
	try {
		outp = response.getOutputStream();
		URLConnection conn = url.openConnection();
		in = new BufferedInputStream(url.openStream());
		   
		byte[] b = new byte[1024];    
		int i = 0;    
		   
		while((i = in.read(b)) > 0) {    
			outp.write(b, 0, i);    
		}      
		outp.flush();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {    
		if(in!= null) {    
			in.close();    
			in = null;    
		}         
		if(outp != null) {    
	  		outp.close();    
	  		outp = null;    
	  	}
		ExportExcelReport expExc = new ExportExcelReport();
		expExc.deleteExcel(filePath,fileNameOld);
		out.clear();
        out=pageContext.pushBody();
	}
}catch(Exception e){
}
%>
</body>
</html>
