package com.funo.regionremain.action;

import java.util.*;

import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;
import com.funo.regionremain.mgmt.IRegionRemainMgmt;
import com.funo.regionremain.model.RegionRemain;
import com.funo.report.EcharReportUtil;
import com.funo.system.model.SysOperator;
import org.apache.commons.lang.StringUtils;

public class RegionRemainAction extends CommonAction{
	private IRegionRemainMgmt regionRemainMgmt;

	public IRegionRemainMgmt getRegionRemainMgmt() {
		return regionRemainMgmt;
	}
	public void setRegionRemainMgmt(IRegionRemainMgmt regionRemainMgmt) {
		this.regionRemainMgmt = regionRemainMgmt;
	}
	

	/**
	 * 获取所有景区游客驻留时间统计表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionRemain(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionRemainMgmt.queryRegionRemain(new RegionRemain());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 根据条件获取景区游客驻留时间统计表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionRemainList(RegionRemain regionRemain){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			if("q".equalsIgnoreCase(regionRemain.getSearchtype())){
				regionRemain.setTouristtype(touristTypeSql(regionRemain.getAreaCode()));
				regionRemain.setQbeginmonth(qBeginMonthSql(regionRemain.getQbegintime(),regionRemain.getQquarterbegin()));
				result = regionRemainMgmt.queryRegionRemainQsearch(regionRemain);
			}else if("m".equalsIgnoreCase(regionRemain.getSearchtype())){
				regionRemain.setTouristtype(touristTypeSql(regionRemain.getAreaCode()));
				result = regionRemainMgmt.queryRegionRemainMsearch(regionRemain);
			}else{
				if("".equals(regionRemain.getYbegintime())){
					Calendar c=Calendar.getInstance();
					String year = String.valueOf(c.get(Calendar.YEAR));
					regionRemain.setYbegintime(year);
					regionRemain.setYendtime(year);
					regionRemain.setTouristtype(touristTypeSql(regionRemain.getAreaCode()));
					result = regionRemainMgmt.queryRegionRemainYsearch(regionRemain);
				}else{
					regionRemain.setTouristtype(touristTypeSql(regionRemain.getAreaCode()));
					result = regionRemainMgmt.queryRegionRemainYsearch(regionRemain);
				}
			}
			String json = getEchartJsonStr(result);
			ar.setReturnList(result);
			ar.setReturnObject(json);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 对查找的结果集进行重新解析
	 * @param result
	 * @return
	 */
	private String getEchartJsonStr(List result){
		List dataTotalList = new ArrayList();
		List colList = new ArrayList();
		List dataList = new ArrayList();
		colList.add("statDate");
		colList.add("0~2小时");
		colList.add("2~6小时");
		colList.add("6~24小时");
		colList.add("24~48小时");
		colList.add("48小时以上");
		for(int i=0;i<result.size();i++){
			RegionRemain rr = (RegionRemain)result.get(i);
			Map map = new HashMap();
			map.put("statDate", rr.getStattime());
			map.put("0~2小时", rr.getOnetotwohCount());
			map.put("2~6小时",rr.getTwotosixhCount());
			map.put("6~24小时",rr.getSixhtodayCount());
			map.put("24~48小时",rr.getDaytotwodCount());
			map.put("48小时以上",rr.getMoretwodCount());
			dataList.add(map);
		}
		dataTotalList.add(colList);
		dataTotalList.add(dataList);
		Map staticMap = new HashMap();
		staticMap.put("xname","单位（日期）");
		staticMap.put("yname","单位（人数）");
		staticMap.put("caption","景区游客驻留时间分析");
		staticMap.put("subTitle", "统计显示各市各个景区的游客驻留人数分布，可选择景点按年、按季、按月查询。");
		return EcharReportUtil.getMSBarAndLineChartJson(dataTotalList, staticMap, "bar");
	}

	/**
	 * 根据查询的用户类型写sql
	 */
	public String touristTypeSql(Long l){
		String sql = null;
		if(l==1){
			sql = "t.area_code in (select t1.code from SYS_ORGANIZATION t1) and";
		}else if(l==2){
			sql = "t.area_code not in (select t1.code from SYS_ORGANIZATION t1) and";
		}else{
			sql = null;
		}
		return sql;
	}
	/**
	 * 按季度查询的beginmonth
	 */
	public String qBeginMonthSql(String year,String month){
		String bgeinmonthsql = null;
		bgeinmonthsql = year +"-"+ String.valueOf(Integer.valueOf(month)*3);
		return bgeinmonthsql;
	}
		
	
	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			//user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}
