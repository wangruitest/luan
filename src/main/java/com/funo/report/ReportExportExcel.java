package com.funo.report;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import com.funo.db.DBUtil;
import com.funo.report.charts.ReportConstants;
import com.funo.util.Result;

public class ReportExportExcel {
	
	public ReportExportExcel(){}
	

	
	public String[] reportExport(Map paramsMap,String[] timeArr,Map saticMap,String[] headerStr,String title,String number){
		System.out.println(number+"=====++++++=====");
		String[] reStr = null;
		String	endTime=null;
		String  beginTime=null;
		String[][] result = null;
		try {
			if(timeArr.length>0){
				endTime = timeArr[0]; //开始日期
				beginTime = timeArr[timeArr.length-1];//结束日期
				paramsMap.put("endTime", endTime);
				paramsMap.put("beginTime", beginTime);
			}
			if(saticMap.get("PROC_PARAMS")==null){ //默认没指定参数则使用通用参数
				saticMap.put("PROC_PARAMS", ReportConstants.PROCEDURE_NORMAL_PARAMS);
			}
			String chartTypes = (String)saticMap.get("chartTypes");//需要展示的数据图表类型
			String types[]= StringUtils.split(chartTypes,",");
			
			List list = null;
			paramsMap.put("IS_NOT_FETCH", "true");
			list = ChartReportCommonUtil.queryDbData(saticMap,paramsMap);
			String stSql = list.get(0).toString();
			Result rsReport = DBUtil.executeSql(stSql, "funo");
			if(rsReport.aaResult.length == 0){
				return null;
			}
			//获取同比的数据
			String isTb = (String)paramsMap.get("showTb");//判断是否显示同比数据
			if(isTb!=null&&isTb.equals("true")) {
				List tbList = null;
				String tbEndTime = (Integer.valueOf(endTime.substring(0, 4)) - 1) + endTime.substring(4, endTime.length());
				String tbBeginTime = (Integer.valueOf(beginTime.substring(0, 4)) - 1) + beginTime.substring(4, beginTime.length());
				paramsMap.put("endTime", tbEndTime);
				paramsMap.put("beginTime", tbBeginTime);
				tbList = ChartReportCommonUtil.queryDbData(saticMap, paramsMap);
				String tbstSql = tbList.get(0).toString();
				Result tbrsReport = DBUtil.executeSql(tbstSql, "funo");
				result = unite(rsReport.aaResult,tbrsReport.aaResult);
			}else{
				result = rsReport.aaResult;
			}
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			if("".equals(number) || number==null || "underfind".equals(number) || number.isEmpty())
			reStr = exportExcelReport.exportReport(result(result,headerStr), headerStr,title);
			else
			reStr = exportExcelReport.exportReport(result(result,headerStr), headerStr,title,number);
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return reStr;
	}

	// 二维数组纵向合并
	private static String[][] unite(String[][] content1, String[][] content2) {
		String[][] newArrey = new String[][] {};
		List<String[]> list = new ArrayList<String[]>();
		list.addAll(Arrays.<String[]> asList(content1));
		list.addAll(Arrays.<String[]> asList(content2));
		return list.toArray(newArrey);
	}

	public String[][] result(String[][] str,String[] headerStr){
		int i = str.length;
		int l = headerStr.length;
		String[][] result = new String[i][l];
		for(int k=0; k<i; k++){
			for(int j=0;j<l;j++){
				result[k][j] = str[k][j];
			}
		}
		return result;
	}
	
}
