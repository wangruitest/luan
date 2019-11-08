package com.funo.report;

import java.lang.reflect.InvocationTargetException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import com.funo.report.charts.Chart;
import com.funo.report.charts.ChartCreator;
import com.funo.report.charts.header.ChartHeader;
import com.funo.report.charts.header.ChartHeaderCreator;

public class FunsionReportUtil {

	/**
	 * ===========================================================================================================
	 * 获取符合FunsionMsColumn3D格式的数据
	 * @param rs
	 * @param caption
	 * @param xAxisName
	 * @param yAxisName
	 * @return
	 * @throws SQLException
	 * ===========================================================================================================
	 */
	public static String getMsCol3DFormat(ResultSet rs,String caption,String xAxisName,String yAxisName) throws SQLException{
		List   dataList = new ArrayList();
		StringBuffer sb = new StringBuffer(); 
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		while(rs.next()){
			for(int i=0;i<colCount;i++){
				dataList.add(rs.getString(i+1));
			}
		}
		sb.append("<graph caption='"+caption+"'  xAxisName='"+xAxisName+"' yAxisName='"+yAxisName+"' baseFont='宋体' baseFontSize='12' decimalPrecision='0' showNames='1' formatNumberScale='0' >");
		for(int i=0;i<colCount;i++){
			if(i==0){
				sb.append("<categories>");
				for(int k=i;k<dataList.size();k=k+colCount){
					sb.append("<category name='"+dataList.get(k)+"' hoverText='"+dataList.get(k)+"'/>");
				}
				sb.append("</categories>");
			}else{
				sb.append("<dataset seriesname='"+rsmd.getColumnName(i+1)+"' showValue='1'>");
				for(int k=i;k<dataList.size();k=k+colCount){
					sb.append("<set value='"+dataList.get(k)+"'/>");
				}
				sb.append("</dataset>");
			}
		}
		sb.append("</graph>");
		rs.close();
		return sb.toString();
	} 
	
	/**
	 * ===========================================================================================================
	 * 获取饼状图FusionPie3D格式数据
	 * @param dataMap (name,value)
	 * @param caption
	 * @return
	 * ===========================================================================================================
	 */
	public static String getPie3DFormat(Map<String ,String> dataMap,String caption){
		StringBuffer       sb    = new StringBuffer();
		sb.append("<graph caption='"+caption+"' decimalPrecision='0' " +
				"showPercentageValues='0' showNames='1' " +
				" baseFont='宋体' baseFontSize='12' pieFillAlpha='70' formatNumberScale='0' >");
		Set<String> key = dataMap.keySet();
        for (Iterator it = key.iterator(); it.hasNext();) {
            String columnName = (String) it.next();
            sb.append("<set value='"+dataMap.get(columnName)+"' name='"+columnName+"'/>");
        }
		sb.append("</graph>");
		return sb.toString();
	}
	
	/**
	 * ===========================================================================================================
	 * 将数据库数据转换为fusionLine格式数据
	 * @param dataList
	 * @return
	 * @throws SQLException 
	 * ===========================================================================================================
	 */
	public static String getMsLine2DFormat(ResultSet rs,String caption,String xAxisName,String yAxisName) throws SQLException{
		
		List dataList = new ArrayList();
		StringBuffer sb = new StringBuffer();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		while(rs.next()){
			for(int i=0;i<colCount;i++){
				dataList.add(rs.getString(i+1));
			}
		}
		sb.append("<graph caption='"+caption+"'  xAxisName='"+xAxisName+"' yAxisName='"+yAxisName+"'  baseFont='宋体' baseFontSize='12' showNames='1' decimalPrecision='0' formatNumberScale='0' >");
		sb.append("  <categories>");
		for(int i=0;i<dataList.size();i=i+colCount){
			sb.append("     <category name='"+dataList.get(i).toString()+"' />");
		}
		sb.append("  </categories>");
		for(int i=1;i<colCount;i++){
			sb.append("  <dataset seriesname='"+rsmd.getColumnName(i+1)+"'  showValue='1' >");
			for(int k=i;k<dataList.size();k=k+colCount){
				sb.append("     <set value='"+dataList.get(k).toString()+"'/>");
			}
			sb.append("  </dataset>");
		}
		sb.append("</graph>");
		rs.close();
		return sb.toString();
	}
	
	public static String getLine2DFormat(ResultSet rs) throws SQLException{
		StringBuffer  sb = new StringBuffer();
		List dataList = new ArrayList();
		while(rs.next()){
			dataList.add(rs.getString("RQ"));
			dataList.add(rs.getString("TOURIST_COUNT"));
		}
		sb.append("<graph caption='厦门游客总数预估' subcaption='最近10年游客总数' xAxisName='时间（DATE）' yAxisMinValue='15000' baseFont='宋体' baseFontSize='12' yAxisName='游客数量 (1M=一百万/1K=一千)' showNames='1' decimalPrecision='0' formatNumberScale='0' >");
		for(int i=0;i<dataList.size();i=i+2){
			sb.append("   <set name='"+dataList.get(i)+"' value='"+dataList.get(i+1)+"' hoverText='"+dataList.get(i)+","+dataList.get(i+1)+"'/>");
		}
		sb.append("</graph>");
		return sb.toString();
	}

	/**
	 * <pre><b>功能:</b></br>解析游客归属地的柱状图统计：
	 *	针对年度、季度、月度等统计
	 * <font color="red">注意:生成图形先需要先进行图形header的调用</font>
	 * </pre>
	 * @param list ：从数据库查询出的数据集合
	 * @return ：返回各个跨度需要的字符串数组
	 * @author shijiansheng 2011-9-21
	 * @throws SQLException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public static String[] getChartXML(List list,Map paramsMap,
			String[] timeArr,Map staticMap) throws SQLException,
			IllegalAccessException, InvocationTargetException{
		String noSplit = (String)staticMap.get("noSplit");
		if(StringUtils.isBlank(noSplit)){
			return getSplitChartArr(list,paramsMap, timeArr,staticMap);
		}else{
			return getNoSplitChartArr(list,staticMap);
		}
	}
	
	
	private static  String[] getSplitChartArr(List list,Map paramsMap,
			String[] timeArr,Map staticMap) throws IllegalAccessException, InvocationTargetException{
		String caption =(String)staticMap.get("caption");
		
		String retStrArr[]= new String [timeArr.length];//根据时间创建返回数据的数组
		
		String type = (String)staticMap.get("chartType");
		ChartHeader header = ChartHeaderCreator.createHeader(type);
		String timeType = getTimeType((String)paramsMap.get("searchType"));
		//将参数复制到header中
		BeanUtils.copyProperties(header, staticMap);
		String tCaption=null;
		//根据时间跨度进行字符串的整合
		for(int i=0;i<timeArr.length;i++){
			Chart chart = ChartCreator.createChart(type);
			chart.createBody(list, timeArr[i]);
			tCaption =timeArr[i]+timeType+caption; //标题的组装
			header.setCaption(tCaption);
			header.createHeaderBody(); //header body的创建命令
			chart.createHeader(header); //chart的header创建命令
			retStrArr[i] =chart.getChartXML(); //获取组装好的数据
		}
		return retStrArr;
	}
	
	
	public static String[] getNoSplitChartArr(List list,Map staticMap) throws SQLException,
			IllegalAccessException, InvocationTargetException{
		String caption =(String)staticMap.get("caption");
		String type = (String)staticMap.get("chartType");
		ChartHeader header = ChartHeaderCreator.createHeader(type);
		BeanUtils.copyProperties(header, staticMap);
		
		Chart chart = ChartCreator.createChart(type);
		chart.createBody(list, "");
		header.setCaption(caption);
		header.createHeaderBody(); //header body的创建命令
		chart.createHeader(header); //chart的header创建命令
		String retStrArr[] = new String[1];
		retStrArr[0] =chart.getChartXML(); //获取组装好的
		
		return retStrArr;
	}

	/**
	 * <p><b>功能：</b>获取日期的查询类型</p>
	 * @param searchType
	 * @return
	 */
	private static String getTimeType(String searchType) {
		String timeType = null;
		if("m".equals(searchType)){
			timeType = "月";
		}
		else if("q".equals(searchType)){
			timeType ="季度";
		}else if("d".equals(searchType)){
			timeType = "日";
		}else if("w".equals(searchType)){
			timeType = "周";
		}
		else{
			timeType = "年";
		}
		return timeType;
	}
	
	/**
	 * ===========================================================================================================
	 * 获取符合FunsionColumn3D格式的数据
	 * @param rs
	 * @param caption   标题
	 * @param xAxisName X轴标题
	 * @param yAxisName Y轴标题
	 * @return
	 * @throws SQLException 
	 * ===========================================================================================================
	 */
	public static String getCol3DFormat(ResultSet rs,String caption,String xAxisName,String yAxisName) throws SQLException{
		StringBuffer sb = new StringBuffer(); 
		sb.append("<graph caption='"+caption+"'  xAxisName='"+xAxisName+"' yAxisName='"+yAxisName+"' baseFont='宋体' baseFontSize='12' decimalPrecision='0' showNames='1' formatNumberScale='0' >");
		while(rs.next()){
			sb.append("<set name='"+rs.getString("TITLE")+"' value='"+rs.getString("TOURISTCOUNT")+"'/>");
		}
		sb.append("</graph>");
		return sb.toString();
	}
}
