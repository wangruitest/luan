package com.funo.report;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
//import org.jfree.util.Log;

import com.funo.db.ProxoolUtil;
import com.funo.report.charts.ReportConstants;


/**
 * 
 * <pre>描述：该类主要负责图形报表的生成操作，提供的对外接口调用方式为：
 * 	<code>ChartReportCommonUtil.getChartXmlStr</code>
 *  <b><i>目前只提供存储过程的数据抽取方式</i></b>
 * </pre>
 * @author shijiansheng 
 *
 */
/**
 * 
 * <pre>描述：该类主要负责图形报表的生成操作，提供的对外接口调用方式为：
 * 	<code>ChartReportCommonUtil.getChartXmlStr</code>
 *  <b><i>目前只提供存储过程的数据抽取方式</i></b>
 * </pre>
 * @author shijiansheng 
 *
 */
public class ChartReportCommonUtil {

	/**
	 *<p> 
	 *	<b>功能：</b>限制该类的创建，该类作为工具类进行使用
	 *</p>
	 */
	private ChartReportCommonUtil(){}
	
	/**
	 * <p><b>功能：</b>
	 * 		从数据库中查询数据，该类提供数据的抽取方式为<u>存储过程</u>的调用方式。
	 * 生成步骤包括：
	 * <ol>
	 * 	<li>生成调用存储过程的语句，语句形式如<code>{call procedureName(?,?,?)}</code></li>
	 *  <li>组装查询回的数据格式并以<code>list</code>中存储<code>map</code> 方式返回
	 * </ol>
	 * </p>
	 * @param staticMap：<code>map</code>参数，存储初始化的静态参数
	 * @param paramMap：<code>map</code>参数，存储动态改变的参数
	 * @return tList:返回形式以<code>list</code>方式返回
	 * 		包括：列名 list ，数据 List
	 * @throws SQLException：可能出现的无法关闭的情况，需要进行捕获处理
	 * @author shijiansheng 2011-10-01
	 */
	public static List queryDbData(Map staticMap ,Map paramMap) throws SQLException{
		Connection         conn  = null;
		CallableStatement  cs    = null;
		ResultSet          rs    = null;
		List<Object> tList = new ArrayList<Object>();
		try{
			
			String paramsStr = (String)staticMap.get("PROC_PARAMS");
			String[] paramArr = StringUtils.split(paramsStr,",");
			int plen = paramArr.length; 
			//占位参数的组装
			String procc_param_marks = "(";
			for(int i =0;i<plen;i++){
					procc_param_marks+="?,";
			} 
			procc_param_marks +="?,?,?)";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = ProxoolUtil.getConnection("funo");
			cs = conn.prepareCall( "{call "+(String)staticMap.get("procedureName") +procc_param_marks+"}",
								  ResultSet.TYPE_SCROLL_INSENSITIVE,
								  ResultSet.CONCUR_UPDATABLE);
			
			for(int j =0;j<plen;j++){
				cs.setString(j+1,(String)paramMap.get(paramArr[j]));
			}
			
			String isNot_fetch = (String)paramMap.get("IS_NOT_FETCH"); //是否抓取数据
			System.out.println(StringUtils.defaultIfEmpty(isNot_fetch,""));
			cs.setString(plen+1, StringUtils.defaultIfEmpty(isNot_fetch,""));
			cs.registerOutParameter(plen+2, oracle.jdbc.OracleTypes.VARCHAR);
			cs.registerOutParameter(plen+3, oracle.jdbc.OracleTypes.CURSOR);//最后的参数为返回的cursor
			cs.execute();
			if(StringUtils.isBlank(isNot_fetch)){ //is_fetch为空执行数据抓取
				rs = (ResultSet)cs.getObject(plen+3); //获取cursor的返回结果集
				tList = getDBDatas(rs);
			}else{ 
				String sql= cs.getString(plen+2);
				tList.add(sql);
			}
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			if(cs!=null) cs.close();
			if(rs!=null) rs.close(); 
			if(conn!=null) conn.close();
		}
		return tList;
	}
	
	/**
	 * <p><b>功能:</b>获取数据集并解析成列名<code>List</code>和数据集<code>List</code></p>
	 * @param rs：数据集
	 * @return rList： 包括列名和数据集
	 * @throws SQLException：数据集检索出错需要抛出由调用方法捕获进行处理
	 */
	private static List getDBDatas(ResultSet rs) throws SQLException{
		 List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		 List<String> colNameList = new ArrayList<String>();
		 ResultSetMetaData rsmd = rs.getMetaData();
		 while(rs.next()){
			 Map<String,String> tMap = new LinkedHashMap<String,String>(); //使用 TreeMap保持记录顺序
			 for(int i=0;i<rsmd.getColumnCount();i++){
				 String  colName = rsmd.getColumnName(i+1);
				 if(rs.isFirst()){ //非第一行，则不加入列名，防止重复
					 colNameList.add(colName);
				 }
				 tMap.put(colName, rs.getString(colName));
			 }
			 dataList.add(tMap);
		 }
		 List rList = new ArrayList();
		 rList.add(colNameList);
		 rList.add(dataList);
		 return rList;
	}


	/**
	 * <p>
	 * <b>功能：</b>生成图像报表需要的数据：
	 * 	<ol>
	 * 		<li>查询数据库数据</li>
	 * 		<li>组装为funsionChart需要的数据格式</li>
	 * 	</ol>
	 * </p>
	 * @param paramsMap：主要包括查询需要的相关动态参数
	 * @param timeArr：根据查询的时间解析的时间跨度数组
	 * @param saticMap: 包括初始化的相关参数
	 * @return ：返回报表解析需要的字符串数组
	 */
	public static Map getEChartJson(Map paramsMap,String[] timeArr,Map saticMap){
		Map rMap = new HashMap();
		try {
			if(timeArr.length>0){
				String	endTime = timeArr[0]; //开始日期
				String  beginTime = timeArr[timeArr.length-1];//结束日期
				paramsMap.put("endTime", endTime);
				paramsMap.put("beginTime", beginTime);
			}
			if(saticMap.get("PROC_PARAMS")==null){ //默认没指定参数则使用通用参数
				saticMap.put("PROC_PARAMS", ReportConstants.PROCEDURE_NORMAL_PARAMS);
			}
			String chartTypes = (String)saticMap.get("chartTypes");//需要展示的数据图表类型
			String types[]= StringUtils.split(chartTypes,",");
			List list = null;
			for(int i=0;i<types.length;i++){
				if(i==0){ //只在第一次进行数据的检索
					list = queryDbData(saticMap,paramsMap);
				}
				saticMap.put("chartType", types[i]);
				String[] json = null;
				if(types[i].startsWith("MS")){//复杂报表
					json = EcharReportUtil.getMSChartJson(list, paramsMap, timeArr, saticMap, types[i]);
				}else{
					json = EcharReportUtil.getSingleChartJson(list, paramsMap, timeArr, saticMap, types[i]);
				}
				rMap.put(types[i], json);
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return rMap;
	}

	/**
	 * 获取报表数据列表模块的数据
	 * @param saticMap 主要包括报表的标题，副标题，报表对应的存储过程，以及存储过程所需要的参数名称
	 * @param paramsMap 主要是报表查询条件
	 * @param timeArr 查询时间段
	 * @return
	 * @throws SQLException
	 */
	public static List getTableStr(Map saticMap,Map paramsMap,String[] timeArr) throws SQLException{
        System.out.println("入参："+paramsMap.toString());
        List list = null;
		Connection  conn  = null;
		ResultSet   rs    = null;
		String	endTime = null;
		String  beginTime = null;
		try {
			if(timeArr.length>0){
				endTime = timeArr[0]; //开始日期
				beginTime = timeArr[timeArr.length-1];//结束日期
				paramsMap.put("endTime", endTime);
				paramsMap.put("beginTime", beginTime);
			}
			list = queryDbData(saticMap,paramsMap);
			String IS_NOT_FETCH = (String)paramsMap.get("IS_NOT_FETCH");
			System.out.println("IS_NOT_FETCH"+IS_NOT_FETCH);
			if(!StringUtils.isBlank(IS_NOT_FETCH)){
				conn = ProxoolUtil.getConnection("funo");
				String sql = (String)list.get(0);
				System.out.println("sql=========="+sql);
				rs = conn.createStatement().executeQuery(sql); //获取cursor的返回结果集
				list = getDBDatas(rs);
				System.out.println("list=========="+list);
			}
			String isTb = (String)paramsMap.get("showTb");//判断是否显示同比数据
			if(isTb!=null&&isTb.equals("true")){
				List tbList = null;
				String tbEndTime = (Integer.valueOf(endTime.substring(0,4))-1) + endTime.substring(4, endTime.length());
				String tbBeginTime = (Integer.valueOf(beginTime.substring(0,4))-1) + beginTime.substring(4, beginTime.length());
				paramsMap.put("endTime", tbEndTime);
				paramsMap.put("beginTime", tbBeginTime);
				tbList = queryDbData(saticMap,paramsMap);
				if(!StringUtils.isBlank(IS_NOT_FETCH)){
					String sql = (String)tbList.get(0);
					//System.out.println(sql);
					rs = conn.createStatement().executeQuery(sql); //获取cursor的返回结果集
					tbList = getDBDatas(rs);
				}
				List result = (List)list.get(1);
				//用于按年同比时过滤重复的字段内容
				Map<Object,String> resultMap = new HashMap<Object,String>();
				for(Object obj:result){
					resultMap.put(obj,null);
				}
				List tbResult = (List)tbList.get(1);
				for(Object tbObj:tbResult){
					if(!resultMap.containsKey(tbObj)){//过滤重复内容
						result.add(tbObj);
					}
				}
			}
		} catch (Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null) rs.close(); 
			if(conn!=null) conn.close();
		}
		return list;
	}
}