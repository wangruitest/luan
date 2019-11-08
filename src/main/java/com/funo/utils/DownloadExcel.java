package com.funo.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


public class DownloadExcel {
	
	/**
	 * 下载EXCEL模板
	 * @param excelName String 预下载的EXCEL名称
	 * @param aExcelTitle String EXCEL模板的TITLE信息
	 * @param aaExcelContent String EXCEL模板的内容
	 * @throws Exception
	 */
	public static String downloadExample(String excelName, String[] aExcelTitle, String[][] aaExcelContent) throws Exception {
		return create(excelName, aExcelTitle, aaExcelContent);
	}
	
	/**
	 * 创建EXCEL文件
	 * @param excelName String EXCEL模板文件名
	 * @param aExcelTitle String EXCEL模板的TITLE信息
	 * @param aaExcelContent String EXCEL模板的内容
	 * @return String 处理好之后的EXCEL文件路径，供后续调用
	 * @throws Exception
	 */
	private static String create(String excelName, String[] aExcelTitle, String[][] aaExcelContent) throws Exception {
		//获取文件下载目录
		HttpServletRequest request = ApplicationContext.getDwrRequest();
		String pathStr = request.getSession().getServletContext().getRealPath("") + "\\temp\\";
		//判断目录是否存在
		File fileDir = new File(pathStr);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		pathStr += excelName + ".xls";
		File excel = new File(pathStr);
		WritableWorkbook workBook = null;
		excel.createNewFile();
		workBook = Workbook.createWorkbook(excel);
		WritableSheet tableSheet = workBook.createSheet(excelName, 0);
		//写入EXCEL的TITLE信息
		for(int i=0; i<aExcelTitle.length; i++) {
			tableSheet.addCell(new Label(i, 0, aExcelTitle[i]));
		}
		//写入EXCEL的内容
		for(int i=1; i<=aaExcelContent.length; i++) {
			for(int j=0; j<aaExcelContent[i-1].length; j++) {
				tableSheet.addCell(new Label(j, i, aaExcelContent[i-1][j]));
			}
		}
		workBook.write();
		workBook.close();
		return pathStr;
	}
}
