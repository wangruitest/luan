package com.funo.report;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.commons.lang.StringUtils;

import com.funo.utils.ApplicationContext;


/*
 * jsp页面导出excel工具类
 * */
public class ExportExcelReport extends Thread {
	private static Integer pageMaxColumns = 30000;
	private static Integer maxColumns = 300000;
	
	public static Integer getMaxColumns() {
		return maxColumns;
	}

	public static void setMaxColumns(Integer maxColumns) {
		ExportExcelReport.maxColumns = maxColumns;
	}

	private int sheetSize=0;
	
	public ExportExcelReport(){
		super();
	}
	
	public ExportExcelReport(int sheetSize){
		this.sheetSize = sheetSize;
	}
	

	/**
	 * 导出EXCEL数据(jsp页面报表导出)
	 * @param selectResult 要导出的记录集
	 * @param fileName     文件名
	 * @param header       表头
	 */
	public String[] exportReport(String[][] dataResult, String[] header){
		String[] str = new String[2];
		try{		
			//获取服务端创建excel路径
			String path = getExcelCreatePath();
			//获取文件名称
			String fileName = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());
			//创建excel到服务器上的某个指定的目录中
			createExcel(dataResult,fileName,path,header);
			//str[0] = path;
		    str[0] = "";
			str[1] = fileName;
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * 导出EXCEL数据(含标题)(增加总计)
	 * @param dataResult
	 * @param header
	 * @param title
	 * @return
	 */
	public String[] exportReport(String[][] dataResult, String[] header,String title,String number){
		String[] str = new String[2];
		try{
			//获取服务端创建excel路径
			String path = getExcelCreatePath();
			System.out.println("获取该项目的绝对路径地址"+path);
			//获取文件名称
			String fileName = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());
			//创建excel到服务器上的某个指定的目录中
			createExcel(dataResult,fileName,path,header,title,number);
			//下载创建好的excel到本地
			str[0] = "";
			str[1] = fileName;
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
	public String[] exportReport(String[][] dataResult, String[] header,String title){
		String[] str = new String[2];
		try{
			//获取服务端创建excel路径
			String path = getExcelCreatePath();
			System.out.println("获取该项目的绝对路径地址"+path);
			//获取文件名称
			String fileName = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date());
			//创建excel到服务器上的某个指定的目录中
			createExcel(dataResult,fileName,path,header,title);
			//下载创建好的excel到本地
			str[0] = "";
			str[1] = fileName;
			System.out.println(fileName+"==============888888");
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
	
	
	/**
	 * 获取excel服务端创建路径(jsp页面)
	 * @return
	 */
	private static String getExcelCreatePath(){
		String path = null;
		try{
			HttpServletRequest request = ApplicationContext.getDwrRequest();
			String pathStr = request.getSession().getServletContext().getRealPath("");
			String pathStr2 = request.getSession().getServletContext().getContextPath();
			path = pathStr.replace("\\", "/") + "/temp/";
		}catch(Exception e){
			e.printStackTrace();
		}
		return path;
	}
	
	/**
	 * 获取excel服务端创建路径
	 * @return
	 */
	private String getCreateFilePath(){
		String path = null;
		try{
			String pathStr = System.getProperty("user.dir");
			path = pathStr.replace("\\", "/") + "/temp/";
		}catch(Exception e){
		}
		return path;
	}
	
	/**
	 * 创建要导出的Exel文件
	 * @param dataResult 数据记录
	 * @param fileName   文件名称
	 * @param createPath 创建路径
	 * @param header     表头
	 * @param title      标题
	 * @throws Exception 
	 */
	public  void createExcel(String[][] dataResult, String fileName,String createPath, String[] header,String title,String number) throws Exception{
		System.out.println(number+"===========");
		//判断记录数是否超过300000
		int totalNum = dataResult.length;
		if(totalNum == 0)
			throw new Exception("无记录！");
		if(totalNum > maxColumns)
			throw new Exception("数据过大，超过300000条，建议按时间段分批次导出。");
		List<String[][]> aaDataList = new ArrayList<String[][]>();
		int sheetNum = 0;
		//判断sheet数量，对数据进行重新封装，每个sheet存30000条记录
		if(totalNum%pageMaxColumns==0) {
			sheetNum = totalNum/pageMaxColumns;
		} else {
			sheetNum = totalNum/pageMaxColumns + 1;
		}
		for(int i=0; i<sheetNum; i++) {
			if(i!=sheetNum-1) {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, ExportExcelReport.pageMaxColumns*(i+1), dataResult.getClass()));
			} else {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, totalNum, dataResult.getClass()));
			}
		}
		//判断目录是否存在
		File fileDir = new File(createPath);
		if (!fileDir.exists())
			fileDir.mkdirs();
		String filePath = createPath + fileName + ".xls";
		System.out.println(filePath+"987000000==========");
		File excel = new File(filePath);
		excel.createNewFile();
		WritableWorkbook workBook = Workbook.createWorkbook(excel);
		
		WritableSheet tableSheet = null;
		for(int i=0;i<aaDataList.size();i++){
			tableSheet = workBook.createSheet(""+i, i);
			String[][] sheetData = aaDataList.get(i);
			//添加标题
			if(StringUtils.isNotBlank(title)){
				for(int k=0; k<header.length; k++) {
					tableSheet.addCell(new Label(k,0,title,getTitleCellStyle()));
				}
				tableSheet.mergeCells(0, 0, header.length-1,0);
			}
			//添加表头
			for(int k=0; k<header.length; k++) {
				tableSheet.addCell(new Label(k,1,header[k],getHeaderCellStyle()));
			}
			String[] numbers = number.split(","); 
			/*int length =numbers.length;
			int sum = 0;
			int sum1 = 0;
			int sum2 = 0;
			int sum3 = 0;
			int sum4 = 0;*/
			//添加数据
			
			for(int k=0; k<sheetData.length; k++) {
				for(int j=0;j<sheetData[k].length;j++){
					tableSheet.addCell(new Label(j,k+2,sheetData[k][j],getBodyCellStyle()));
				}
			}
			
			/*for(int k=0; k<sheetData.length; k++) {
				if(length==1)
					sum+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[0])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[0])]);
					else if(length==2){
					sum+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[0])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[0])]);
					sum1+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[1])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[1])]);
					}
					else if(length==3){
					sum+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[0])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[0])]);
					sum1+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[1])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[1])]);
					sum2+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[2])]==null ? "0" : sheetData[k][Integer.parseInt(numbers[2])]);	
					}
					else if(length==4){
					sum+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[0])]);
					sum1+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[1])]);
					sum2+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[2])]);	
					sum3+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[3])]);	
					System.out.println(sum3);
					}
					else if(length==5){
						sum+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[0])]);
						sum1+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[1])]);
						sum2+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[2])]);	
						sum3+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[3])]);	
						sum4+=Integer.parseInt(sheetData[k][Integer.parseInt(numbers[4])]);	
					}
				for(int j=0;j<sheetData[k].length;j++){
					tableSheet.addCell(new Label(j,k+3,sheetData[k][j],getBodyCellStyle()));
					
					//System.out.println(sheetData[k][Integer.parseInt(number)]);
					
					}
				
			}*/
			//添加总计
			/*tableSheet.addCell(new Label(0,2,"总计:",getHeaderCellStyle()));
				if(length==1)
				    tableSheet.addCell(new Label(Integer.parseInt(numbers[0]),2,String.valueOf(sum),getHeaderCellStyle()));
			    if(length==2){
			    	tableSheet.addCell(new Label(Integer.parseInt(numbers[0]),2,String.valueOf(sum),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[1]),2,String.valueOf(sum1),getHeaderCellStyle()));
			    }
				if(length==3){
					tableSheet.addCell(new Label(Integer.parseInt(numbers[0]),2,String.valueOf(sum),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[1]),2,String.valueOf(sum1),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[2]),2,String.valueOf(sum2),getHeaderCellStyle()));
				}
				if(length==4){
					tableSheet.addCell(new Label(Integer.parseInt(numbers[0]),2,String.valueOf(sum),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[1]),2,String.valueOf(sum1),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[2]),2,String.valueOf(sum2),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[3]),2,String.valueOf(sum3),getHeaderCellStyle()));
			}
				if(length==5){
					tableSheet.addCell(new Label(Integer.parseInt(numbers[0]),2,String.valueOf(sum),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[1]),2,String.valueOf(sum1),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[2]),2,String.valueOf(sum2),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[3]),2,String.valueOf(sum3),getHeaderCellStyle()));
					tableSheet.addCell(new Label(Integer.parseInt(numbers[4]),2,String.valueOf(sum4),getHeaderCellStyle()));
				
			}*/
			  //  tableSheet.mergeCells(0, 1, header.length-1,1);	
		}
		workBook.write();
		workBook.close();
	}
	
	public  void createExcel(String[][] dataResult, String fileName,String createPath, String[] header,String title) throws Exception{
		//判断记录数是否超过300000
		int totalNum = dataResult.length;
		if(totalNum == 0)
			throw new Exception("无记录！");
		if(totalNum > maxColumns)
			throw new Exception("数据过大，超过300000条，建议按时间段分批次导出。");
		List<String[][]> aaDataList = new ArrayList<String[][]>();
		int sheetNum = 0;
		//判断sheet数量，对数据进行重新封装，每个sheet存30000条记录
		if(totalNum%pageMaxColumns==0) {
			sheetNum = totalNum/pageMaxColumns;
		} else {
			sheetNum = totalNum/pageMaxColumns + 1;
		}
		for(int i=0; i<sheetNum; i++) {
			if(i!=sheetNum-1) {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, ExportExcelReport.pageMaxColumns*(i+1), dataResult.getClass()));
			} else {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, totalNum, dataResult.getClass()));
			}
		}
		//判断目录是否存在
		File fileDir = new File(createPath);
		if (!fileDir.exists())
			fileDir.mkdirs();
		String filePath = createPath + fileName + ".xls";
		File excel = new File(filePath);
		excel.createNewFile();
		WritableWorkbook workBook = Workbook.createWorkbook(excel);
		
		WritableSheet tableSheet = null;
		for(int i=0;i<aaDataList.size();i++){
			tableSheet = workBook.createSheet(""+i, i);
			String[][] sheetData = aaDataList.get(i);
			//添加标题
			if(StringUtils.isNotBlank(title)){
				for(int k=0; k<header.length; k++) {
					tableSheet.addCell(new Label(k,0,title,getTitleCellStyle()));
				}
				tableSheet.mergeCells(0, 0, header.length-1,0);
			}
			//添加表头
			for(int k=0; k<header.length; k++) {
				tableSheet.addCell(new Label(k,1,header[k],getHeaderCellStyle()));
			}
			//添加数据
			for(int k=0; k<sheetData.length; k++) {
				for(int j=0;j<sheetData[k].length;j++){
					tableSheet.addCell(new Label(j,k+2,sheetData[k][j],getBodyCellStyle()));
				}
			}
		}
		workBook.write();
		workBook.close();
	}
	
	/**
	 * 创建要导出的Exel文件
	 * @param dataResult 数据记录
	 * @param fileName   文件名称
	 * @param createPath 创建路径
	 * @param header     表头
	 * @throws Exception 
	 */
	public  void createExcel(String[][] dataResult, String fileName,String createPath, String[] header) throws Exception{
		//判断记录数是否超过300000
		int totalNum = dataResult.length;
		if(totalNum == 0)
			throw new Exception("无记录！");
		if(totalNum > maxColumns)
			throw new Exception("数据过大，超过300000条，建议按时间段分批次导出。");
		List<String[][]> aaDataList = new ArrayList<String[][]>();
		int sheetNum = 0;
		//判断sheet数量，对数据进行重新封装，每个sheet存30000条记录
		if(totalNum%pageMaxColumns==0) {
			sheetNum = totalNum/pageMaxColumns;
		} else {
			sheetNum = totalNum/pageMaxColumns + 1;
		}
		for(int i=0; i<sheetNum; i++) {
			if(i!=sheetNum-1) {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, ExportExcelReport.pageMaxColumns*(i+1), dataResult.getClass()));
			} else {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, totalNum, dataResult.getClass()));
			}
		}
		//判断目录是否存在
		File fileDir = new File(createPath);
		if (!fileDir.exists())
			fileDir.mkdirs();
		String filePath = createPath + fileName + ".xls";
		File excel = new File(filePath);
		excel.createNewFile();
		WritableWorkbook workBook = Workbook.createWorkbook(excel);
		
		WritableSheet tableSheet = null;
		for(int i=0;i<aaDataList.size();i++){
			tableSheet = workBook.createSheet(""+i, i);
			String[][] sheetData = aaDataList.get(i);
			//添加表头
			for(int k=0; k<header.length; k++) {
				tableSheet.addCell(new Label(k,0,header[k],getHeaderCellStyle()));
			}
			//添加数据
			for(int k=0; k<sheetData.length; k++) {
				for(int j=0;j<sheetData[k].length;j++){
					tableSheet.addCell(new Label(j,k+1,sheetData[k][j],getBodyCellStyle()));
				}
			}
		}
		workBook.write();
		workBook.close();
	}
	/**
	 * 创建要导出的Exel文件(总计)
	 * @param dataResult 数据记录
	 * @param fileName   文件名称
	 * @param createPath 创建路径
	 * @param header     表头
	 * @throws Exception 
	 */
	public  void createExcel1(String[][] dataResult, String fileName,String createPath, String[] header,String number) throws Exception{
		//判断记录数是否超过300000
		int totalNum = dataResult.length;
		if(totalNum == 0)
			throw new Exception("无记录！");
		if(totalNum > maxColumns)
			throw new Exception("数据过大，超过300000条，建议按时间段分批次导出。");
		List<String[][]> aaDataList = new ArrayList<String[][]>();
		int sheetNum = 0;
		//判断sheet数量，对数据进行重新封装，每个sheet存30000条记录
		if(totalNum%pageMaxColumns==0) {
			sheetNum = totalNum/pageMaxColumns;
		} else {
			sheetNum = totalNum/pageMaxColumns + 1;
		}
		for(int i=0; i<sheetNum; i++) {
			if(i!=sheetNum-1) {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, ExportExcelReport.pageMaxColumns*(i+1), dataResult.getClass()));
			} else {
				aaDataList.add((String[][]) Arrays.copyOfRange(dataResult, ExportExcelReport.pageMaxColumns*i, totalNum, dataResult.getClass()));
			}
		}
		//判断目录是否存在
		File fileDir = new File(createPath);
		if (!fileDir.exists())
			fileDir.mkdirs();
		String filePath = createPath + fileName + ".xls";
		File excel = new File(filePath);
		excel.createNewFile();
		WritableWorkbook workBook = Workbook.createWorkbook(excel);
		
		WritableSheet tableSheet = null;
		for(int i=0;i<aaDataList.size();i++){
			tableSheet = workBook.createSheet(""+i, i);
			String[][] sheetData = aaDataList.get(i);
			//添加表头
			for(int k=0; k<header.length; k++) {
				tableSheet.addCell(new Label(k,0,header[k],getHeaderCellStyle()));
			}
			int num=0;
			//添加数据
			for(int k=0; k<sheetData.length; k++) {
				for(int j=0;j<sheetData[k].length;j++){
					tableSheet.addCell(new Label(j,k+1,sheetData[k][j],getBodyCellStyle()));
					num+=Integer.parseInt(sheetData[k][Integer.parseInt(number)]);
				}
			}
			//添加总计
			String[] numbers = number.split(","); 
			int length =numbers.length;
			tableSheet.addCell(new Label(0,1,"总计:",getHeaderCellStyle()));
			for(int j=0;j<length;j++){
				tableSheet.addCell(new Label(j,1,String.valueOf(num),getHeaderCellStyle()));
			}
		}
		workBook.write();
		workBook.close();
	}
	
public static final List<Thread> runningThreads = new ArrayList<Thread>(); 
	
	public void regist(Thread t){  
	    synchronized(runningThreads){   
	        runningThreads.add(t);  
	    }  
	}  
	public void unRegist(Thread t){  
	   synchronized(runningThreads){   
	        runningThreads.remove(t);  
	    }  
	}  
	
	/**
	 * 设置EXCEL标题样式
	 * @return
	 */
	public static WritableCellFormat getTitleCellStyle(){
        /*  
         * WritableFont.createFont("宋体")：设置字体为宋体  
         * 10：设置字体大小  
         * WritableFont.BOLD:设置字体加粗（BOLD：加粗     NO_BOLD：不加粗）  
         * false：设置非斜体  
         * UnderlineStyle.NO_UNDERLINE：没有下划线  
         */   
        WritableFont font = new WritableFont(WritableFont.createFont("宋体"),   
                                             16,    
                                             WritableFont.BOLD,    
                                             false,   
                                             UnderlineStyle.NO_UNDERLINE);   
           
        WritableCellFormat titleFormat = new WritableCellFormat(NumberFormats.TEXT);   
        try {   
            //添加字体设置   
        	titleFormat.setFont(font);   
            //设置单元格背景色：表头为黄色   
        	titleFormat.setBackground(Colour.WHITE);   
            //设置表头表格边框样式   
            //整个表格线为粗线、黑色   
        	titleFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);   
            //表头内容水平居中显示   
        	titleFormat.setAlignment(Alignment.CENTRE);       
        } catch (WriteException e) {   
            System.out.println("标题单元格样式设置失败！");   
        }  
        return titleFormat;   
	}
	
	/**  
     * 表头单元格样式的设定  
     */   
    public static WritableCellFormat getHeaderCellStyle(){   
           
        /*  
         * WritableFont.createFont("宋体")：设置字体为宋体  
         * 10：设置字体大小  
         * WritableFont.BOLD:设置字体加粗（BOLD：加粗     NO_BOLD：不加粗）  
         * false：设置非斜体  
         * UnderlineStyle.NO_UNDERLINE：没有下划线  
         */   
        WritableFont font = new WritableFont(WritableFont.createFont("宋体"),   
                                             11,    
                                             WritableFont.NO_BOLD,    
                                             false,   
                                             UnderlineStyle.NO_UNDERLINE);   
           
        WritableCellFormat headerFormat = new WritableCellFormat(NumberFormats.TEXT);   
        try {   
            //添加字体设置   
            headerFormat.setFont(font);   
            //设置单元格背景色：表头为黄色   
            headerFormat.setBackground(Colour.ICE_BLUE);   
            //设置表头表格边框样式   
            //整个表格线为粗线、黑色   
            headerFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);   
            //表头内容水平居中显示   
            headerFormat.setAlignment(Alignment.CENTRE);       
        } catch (WriteException e) {   
            System.out.println("表头单元格样式设置失败！");   
        }   
        return headerFormat;   
    }  
    
    /**  
     * 表头单元格样式的设定  
     */   
    public static WritableCellFormat getBodyCellStyle(){   
           
        /*  
         * WritableFont.createFont("宋体")：设置字体为宋体  
         * 10：设置字体大小  
         * WritableFont.NO_BOLD:设置字体非加粗（BOLD：加粗     NO_BOLD：不加粗）  
         * false：设置非斜体  
         * UnderlineStyle.NO_UNDERLINE：没有下划线  
         */   
        WritableFont font = new WritableFont(WritableFont.createFont("宋体"),   
                                             10,    
                                             WritableFont.NO_BOLD,    
                                             false,   
                                             UnderlineStyle.NO_UNDERLINE);   
           
        WritableCellFormat bodyFormat = new WritableCellFormat(font);   
        try {   
            //设置单元格背景色：表体为白色   
            bodyFormat.setBackground(Colour.WHITE);   
            //设置表头表格边框样式   
            //整个表格线为细线、黑色   
            bodyFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
               
        } catch (WriteException e) {   
            System.out.println("表体单元格样式设置失败！");   
        }   
        return bodyFormat;   
    }   
    
    /**
     * 将指定的列中，相同的内容纵向合并
     * @param fileName
     * @param createPath
     * @param colNum[]  指定要合并的列数
     * @param mergeCount 要合并的单元格数量
     * @throws Exception
     */
	public  void mergeCells(String fileName,String createPath,int[] colNum,int mergeCount) throws Exception{
		String[] fileNames = fileName.split("_");
		String fullPath = createPath+File.separator+fileNames[1]+".xls";
		String newFullPath = createPath+File.separator+fileName+".xls";
		File file = new File(fullPath);
		File newFile = new File(newFullPath);
		WritableWorkbook wwb = Workbook.createWorkbook(newFile);
		Workbook wb = Workbook.getWorkbook(file);
		Sheet[] sheets = wb.getSheets();
		for(int k=0;k<sheets.length;k++){
			Sheet  sheet = wb.getSheet(k);
			wwb.importSheet(""+k, k, sheet);
			WritableSheet wSheet = wwb.getSheet(k);
			for(int i=0;i<colNum.length;i++){
				for(int j=1;j<sheets[k].getRows();j+=mergeCount){
					wSheet.mergeCells(colNum[i], j, colNum[i],j+mergeCount-1);
				}
			}
		}
		wwb.write();
		wwb.close();
		wb.close();
		file.delete();
	}
	
	
	/*
	 * 前台导出后后台删除原文件
	 * */
	public void deleteExcel(String filePath,String fileName){
		try{

			
			String filedisplay = fileName + ".xls";
			try {    
				filePath = filePath+filedisplay;
				(new File(filePath)).delete();
			} catch(Exception e) {
				e.printStackTrace();
			} 
		}catch(Exception e){
		}
	}
}