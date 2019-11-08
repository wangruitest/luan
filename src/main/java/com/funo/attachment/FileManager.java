package com.funo.attachment;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 文件操作类
 * 
 * @author chenxifu@funo.com.cn
 *
 */
public class FileManager {
	public static final String FILESEQ = System.getProperties().getProperty(
			"file.separator");

	/**
	 * 根据文件名，下载文件，以流文件输出到客户端
	 * 
	 * @param filepathName
	 *            是服务器上的绝对路径
	 * @param response
	 * @throws IOException
	 */
	public static void downFile(String fileName, String filepathName,
			HttpServletResponse response) {
		// String fileName="";
		String punid = "";
		StreamFetcher sf = new StreamFetcher(filepathName, punid);
		File downFile = new File(filepathName);
		if (!downFile.exists()) {
			System.out.println("找不到目标文件,请确定是否存在目标路径:" + filepathName);
			return;
		}

		try {
			InputStream is=new FileInputStream(filepathName);
			if(null==is){
				String temp=" ";
				try{
					is=new   ByteArrayInputStream(temp.getBytes("utf-8")); 
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
			downFile(fileName, sf.getStreamContentType(), is, response);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
			return;
		}
	}

	/**
	 * 
	 * @param fileName
	 * @param fileType
	 * @param is
	 * @param response
	 */
	public static void downFile(String fileName, String fileType,
			InputStream is, HttpServletResponse response) {
		BufferedInputStream bs = new BufferedInputStream(is);
		if (bs != null) {
			try {
				// System.out.println("FileManager:"+fileName);
				response.addHeader("Content-Disposition",
						"attachment; filename="
								+ URLEncoder.encode((fileName == null ? "未命名"
										: fileName), "UTF8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
				return;
			}
			response.setContentType(fileType);
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "public");
			response.setHeader("Cache-Control", "max-age=0");
			OutputStream bos = null;
			try {
				bos = new BufferedOutputStream(response.getOutputStream());
			} catch (IOException e1) {
				e1.printStackTrace();
				return;
			}
			byte[] buff = new byte[2048];
			int bytesRead;
			try {
				while ((bytesRead = is.read(buff, 0, buff.length)) != -1)
					bos.write(buff, 0, bytesRead);
				response.flushBuffer();
			} catch (Exception e) {
				System.out.println("用户取消下载");
			} finally {
				if (null != bos)
					try {
						bos.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				if (null != is)
					try {
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
	}

	/**
	 * 更新和保存文件
	 * 
	 * @param fileName
	 * @param request
	 */
	public static boolean updateFile(String fileName, HttpServletRequest request) {
		File file = new File(fileName);
		FileOutputStream fo; // 文件输出流对象
		try {
			fo = new FileOutputStream(file);
			BufferedInputStream is = new BufferedInputStream(request
					.getInputStream()); // 提交的内容
			byte[] bss = new byte[4096];
			int i = -1; // 每次读取的字节内容
			while ((i = is.read(bss, 0, 4096)) > 0) { // 一次读取4K字节写入
				fo.write(bss, 0, i);
			}
			fo.flush();
			fo.close();
			is.close();
			return true;
		} catch (FileNotFoundException e) {
			System.out.println("找不到文件！" + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("上传文件时出错！" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	/*
	 * 删除文件
	 */
	public void delete(String fileName) {
		File file = new File(fileName);
		if (file.exists()) {
			file.delete();
		}
	}

	/**
	 * 取文件名，不包括路径
	 * 
	 * @param fullName
	 * @return
	 */
	public static String getFileName(String fullName) {
		int pos = fullName.lastIndexOf('/');
		if (pos < 0)
			pos = fullName.lastIndexOf('\\');
		return (pos >= 0 ? fullName.substring(pos + 1) : fullName);
	}
	
	/**
	 * 删除文件夹和下面的文件
	 * 
	 * @param fullName
	 * @return
	 */
	public static boolean deleteDir(String delpath)  {
		try {
			File file = new File(delpath);
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + File.separator + filelist[i]);
					if (!delfile.isDirectory())
						delfile.delete();
					else if (delfile.isDirectory())
						deleteDir(delpath + File.separator+ filelist[i]);
				}
				file.delete();
			}
		} catch ( Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	   /**
     * 将存放在sourceFilePath目录下的源文件,打包成fileName名称的ZIP文件,并存放到zipFilePath。
     * @param sourceFilePath 待压缩的文件路径
     * @param zipFilePath    压缩后存放路径
     * @param fileName       压缩后文件的名称
     * @return flag
     */
    public static boolean fileToZip(String sourceFilePath,String zipFilePath,String fileName) {
        boolean flag = false;
        File sourceFile = new File(sourceFilePath);
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
         
        if(sourceFile.exists() == false) {
            System.out.println(">>>>>> 待压缩的文件目录：" + sourceFilePath + " 不存在. <<<<<<");
        } else {
            try {
                File zipFile = new File(zipFilePath + "/" + fileName + ".zip");
                if(zipFile.exists()) {
                    System.out.println(">>>>>> " + zipFilePath + " 目录下存在名字为：" + fileName + ".zip" + " 打包文件. <<<<<<");
                } else {
                    File[] sourceFiles = sourceFile.listFiles();
                    if(null == sourceFiles || sourceFiles.length < 1) {
                        System.out.println(">>>>>> 待压缩的文件目录：" + sourceFilePath + " 里面不存在文件,无需压缩. <<<<<<");
                    } else {
                        fos = new FileOutputStream(zipFile);
                        zos = new ZipOutputStream(new BufferedOutputStream(fos));
                        byte[] bufs = new byte[1024*10];
                        for(int i=0;i<sourceFiles.length;i++) {
                            // 创建ZIP实体,并添加进压缩包
                            ZipEntry zipEntry = new ZipEntry(sourceFiles[i].getName());
                            zos.putNextEntry(zipEntry);
                            // 读取待压缩的文件并写进压缩包里
                            fis = new FileInputStream(sourceFiles[i]);
                            bis = new BufferedInputStream(fis,1024*10);
                            int read = 0;
                            while((read=bis.read(bufs, 0, 1024*10)) != -1) {
                                zos.write(bufs, 0, read);
                            }
                        }
                        flag = true;
                    }
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            } finally {
                // 关闭流
                try {
                    if(null != bis) bis.close();
                    if(null != zos) zos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
            }
        }
         
        return flag;
    }

}
