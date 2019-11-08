package com.funo.utils;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.commons.lang.StringUtils;

import sun.misc.BASE64Encoder;

/**
 * 文件上传功能
 * @author chenxifu@funo.com.cn
 * @version 1.0
 * @since 2013-07-18
 */
public class FileUploader extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public FileUploader() {
		super();
	}

	/**
	 * 上传文件入口 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestContext requestContext = new ServletRequestContext(request);
		String saveFileName="";
		String message="";
		String result;
		String basePath="";
		String imgValidate=request.getParameter("imgValidate");
		if(null==imgValidate)imgValidate="true";
		boolean success=true;
		if (FileUpload.isMultipartContent(requestContext)) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("utf-8");//设置编码，防止中文文件名乱码
			upload.setSizeMax(Constants.FILE_UPLOAD_MAX_SIZE);
			List items = new ArrayList();
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e1) {
				success=false;
				message="文件上传发生错误:" + e1.getMessage();
			}

			String randomUnid = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());
			
			Iterator<?> it = items.iterator();
			while (it.hasNext()) {
				FileItem fileItem = (FileItem) it.next();
				if(imgValidate.equals("true") && !this.isImage(fileItem.getContentType())){
					success=false;
					message="文件上传发生错误:请选择图片类型文件！如：jpg,gif,png,bmp,jpeg";
					break;
				}
				if (!fileItem.isFormField()) {
					if (fileItem.getName() != null && fileItem.getSize() != 0) {
						saveFileName=randomUnid+this.getExpandName(fileItem.getName());
						basePath=Constants.getAppPath()+Constants.FILE_SEPARATOR+Constants.ATTACHMENT_PATH+Constants.FILE_SEPARATOR;
						File attachmentDir=new File(basePath);
						if(!attachmentDir.exists()){
							attachmentDir.mkdir();
						}
						File newFile = new File(basePath+ saveFileName);
						try {
							fileItem.write(newFile);
						} catch (Exception e) {
							success=false;
							message="文件上传发生错误:" + e.getMessage();
							e.printStackTrace();
						}
					} else {
						success=false;
						message="文件没有选择 或 文件内容为空";
					}
				}//end if

			}//end while
		}//end if
		
		byte[] b = null;  
        String s = null;  
        try {  
            b = message.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        if (b != null) {  
            s = new BASE64Encoder().encode(b);  
        }  
        message=s.replaceAll("\r\n", "");
		
		response.setHeader("Content-type", "text/html;charset=UTF-8");
        OutputStream out = response.getOutputStream();
	    out.write("<meta http-equiv='content-type' content='text/html;charset=UTF-8'>".getBytes());
	    result="{success:'"+success+"'," +
	    		"message:'"+message+"'," +
	    		"saveFileName:'"+Constants.getAppPath()+"temp/"+ saveFileName+"'," +
	    		"relativeFileName:'temp/"+ saveFileName+"'" +
	    		"}";
	    out.write(result.getBytes());
	    out.close();
	}
	/**
	 * 根据文件名获取其扩展名
	 * @param fileName  文件名
	 * @return 扩展名（不包括.）
	 */
	private String getExpandName(String fileName){
		String result=fileName;
		if(!StringUtils.isEmpty(fileName) && fileName.indexOf(".")>=0){
			result=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		}
		return result;
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.doPost(request, response);
	}
	
	private boolean isImage(String type){
		boolean result=false;
		String imageType="image/png,image/jpeg,image/bmp,image/gif";
		if(imageType.indexOf(type.toLowerCase())>=0)result=true;
		return result;
	}
}

