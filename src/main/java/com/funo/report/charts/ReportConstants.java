package com.funo.report.charts;

/**
 * <pre>
 * <b>描述:</b> funsionchart生成需要的一些常量配置
 * @author shijiansheng 
 * </pre>
 */
public class ReportConstants {

	//报表格式
	public final static String PIE2D_CHART = "Pie2D";
	
	public final static String COLUMN2D_CHART = "Column2D";
	
	public final static String LINE2D_CHART = "Line";
	
	public final static String PIE3D_CHART = "Pie3D";
	
	public final static String COLUMN3D_CHART = "Column3D";
	
	public final static String MSCOUMN3D_CHART="MSColumn3D";
	
	public final static String MSCOUMN2D_CHART="MSColumn2D";
	
	public final static String MSSTKCOUMN3D_CHART="MSStackedColumn3D";
	
	public final static String MSLINE_CHART="MSLine";
	
	public final static String MSArea2D_CHART="MSArea2D";
	
	
	
	
	//使用存储过程的名称和默认参数
	public final static String REGION_HOT_PROCEDURE = "P_REGION_HOT_COLUMN";
	
	public final static String REGION_HOT_PROCEDURE_PARAMS = "beginTime,endTime,searchType,areaCodes,cityid,countyid,isHoliday,aLevel";
	
	public final static String ALL_REG_RECEIVE_PROCEDURE = "P_ALL_REG_RECEIVE_COLUMN";
	
	public final static String ALL_REG_RECEIVE_PROCEDURE_PARAMS = "searchType,beginTime,endTime,touristType,cityid,countyid,isHoliday,aLevel";
	
	public final static String ONE_REG_RECEIVE_PROCEDURE = "P_ONE_REG_RECEIVE_COLUMN";
	
	public final static String ONE_REG_RECEIVE_PROCEDURE_JTJ = "P_ONE_REG_RECEIVE_COLUMN_JTJ";
	
	public final static String ONE_REG_RECEIVE_PROCEDURE_PARAMS = "regionId,searchType,beginTime,endTime,touristType,cityid,isHoliday";
	
	public final static String ONE_REG_RECEIVE_PROCEDURE_PARAMS_JTJ = "regionId,searchType,beginTime,endTime,touristType,cityid,isHoliday";
	
	public final static String TRAVEL_STAY_AVETIME_PROCEDURE = "P_TRAVEL_STAY_AVETIME";
	
	public final static String TRAVEL_STAY_AVETIME_PROCEDURE_PARAMS = "beginTime,endTime,searchType,touristType,cityid,countyid,isHoliday,aLevel";
	
	public final static String NEW_TOURISTS_PROCEDURE = "P_NEW_TOURISTS";
	
	public final static String NEW_TOURISTS_PROCEDURE_PARAMS = "beginTime,endTime,regionId,touristType,cityid";
	
	public final static String TOURISTS_FLOW_PROCEDURE = "P_REGION_FLOW";
	
	public final static String TOURISTS_FLOW_PROCEDURE_PARAMS = "beginTime,endTime,regionId,cityid";
	
	public final static String ORGIN_PLACE_PROCEDURE = "P_ORIGIN_PLACE_COLUMN";
	
	public final static String ORGIN_PLACE_PROCEDURE_PARAMS = "beginTime,endTime,searchType,regionId,cityid,province";
	
	public final static String SOURCE_PLACE_PROCEDURE = "P_TOURIST_SOURCE_PLACE_COLUMN";
	
	public final static String SOURCE_PLACE_PROCEDURE_PARAMS = "beginTime,endTime,searchType,cityid,province";
	
	public final static String PROCEDURE_NORMAL_PARAMS= "beginTime,endTime,searchType,areaCodes,cityid,isHoliday,aLevel";
	
	public final static String TOURIST_STAT_DAYS_PROCEDURE = "P_TOURIST_STAY_DAYS";
	
	public final static String TOURIST_STAT_DAYS_PROCEDURE_PARAMS = "beginTime,endTime,searchType,cityid,countyid";
	
	public final static String COLUMN3D_CHART_ID = COLUMN3D_CHART;
	
	public final static String OUTSMS_SUMMARY_ID = COLUMN3D_CHART;
	
	public final static String OUTSMS_SUMMARY_BYDAY = "P_OUTSMS_SUMMARY_TJ_BYDAY";
	
	public final static String OUTSMS_SUMMARY_BYDAY_PROCEDURE_PARAMS = "beginTime,endTime";
	
	public final static String OUTSMS_SUMMARY_BYMONTH = "P_OUTSMS_SUMMARY_TJ_BYMONTH";
	
	public final static String OUTSMS_SUMMARY_BYMONTH_PROCEDURE_PARAMS = "beginTime,endTime";
	
	public final static String OUTSMS_SUMMARY_BYYEAR = "P_OUTSMS_SUMMARY_TJ_BYYEAR";
	
	public final static String OUTSMS_SUMMARY_BYYEAR_PROCEDURE_PARAMS = "beginTime,endTime";
	
	public final static String OUTSIDE_TOURIST_PROCEDURE = "";
	
	public final static String OUTSIDE_TOURIST_PROCEDURE_PARAMS = "";
	
	/**
	 * 节假日地市数据存储过程
	 */
	public final static String HOLIDAY_AREA="holidayareaorscenic.queryholidayarea";
	public final static String HOLIADY_AREA_PARAMS="areaCode,countyCode,holidayLastDay";
	
	//节假日 景区游客接待 存储过程配置
	public final static String HOLIDAY_RECEIVE_PROCEDURE = "P_HOLIDAY_RECEIVE_PROCEDURE";
	
	public final static String HOLIDAY_RECEIVE_PROCEDURE_PARAMS = "cityCode,countyCode,holidayDate";
	
	public final static String HOLIDAY_RECEIVE_FROM_PROCEDURE = "P_HOLIDAY_TOURIST";
	
	public final static String HOLIDAY_RECEIVE_FROM_PROCEDURE_PARAMS = "holidaylastdate,sceniccode";
	
	public final static String FOR_TOUR_RECEPTION_PROCEDURE = "P_TOUR_RECEPTION";
	
	public final static String FOR_TOUR_RECEPTION_PROCEDURE_PARAMS="beginTime,holidayName";
	
    public final static String FOR_TOURS_RECEPTION_PROCEDURE = "P_TOURS_RECEPTION";
	
	public final static String FOR_TOURS_RECEPTION_PROCEDURE_PARAMS="beginTime,holidayName";
	
	

}