package com.funo.report;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import org.apache.commons.lang.StringUtils;

import com.funo.report.charts.ReportConstants;
import com.funo.report.paging.Paging;
import com.funo.util.Result;

public class ReportManager extends Paging {

	@Override
	public Result queryData(ServletRequest request, int beginIndex, int endIndex) {
		String searchType = request.getParameter("searchtype");
		String beginTime  = request.getParameter(searchType+"BeginTime"); 
		String endTime    = request.getParameter(searchType+"EndTime");
		if(searchType.equalsIgnoreCase("q")){
			String bTime  = request.getParameter("qQuarterBegin"); 
			String eTime  = request.getParameter("qQuarterEnd");
			beginTime = beginTime + "-"+bTime;
			endTime   = endTime   + "-"+eTime;
		}
		Result result     = null;
		
		Map<String, String> paramMap = new HashMap<String,String>();
		paramMap.put("beginTime", beginTime);
		paramMap.put("endTime",endTime);
		paramMap.put("searchType",searchType);
		paramMap.put("areaCodes",request.getParameter("areaCodes"));
		paramMap.put("IS_NOT_FETCH","true"); //固定参数
		paramMap.put("regionId", request.getParameter("regionId"));
		paramMap.put("province", request.getParameter("provinces_code"));
		paramMap.put("touristType", request.getParameter("touristtype"));
		paramMap.put("cityid", request.getParameter("cityid"));
		
		Map<String,String> staticMap = new HashMap<String,String>();
		staticMap.put("procedureName", request.getParameter("procedureName"));
		if(StringUtils.isBlank(request.getParameter("PROC_PARAMS"))){
			staticMap.put("PROC_PARAMS", ReportConstants.PROCEDURE_NORMAL_PARAMS);
		}else{
			staticMap.put("PROC_PARAMS",request.getParameter("PROC_PARAMS"));
		}
		
		try {
			List list = ChartReportCommonUtil.queryDbData(staticMap, paramMap);
			String sqlstr = (String)list.get(0);
			System.out.println(sqlstr);
			result = com.funo.db.DBUtil.executeSql(sqlstr,"funo",beginIndex,endIndex);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		String test = "yyyy-Q";
		Result result = com.funo.db.DBUtil.executeSql("select * from dual","funo");
		System.out.println(result.sError_detail);
	}
}
