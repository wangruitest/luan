package com.funo.regionrealtimesumadd.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;
import com.funo.regionrealtimesumadd.mgmt.IRegionRealtimeSumAddMgmt;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;
import com.funo.report.EcharReportUtil;
import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;
import com.funo.utils.DateUtils;
import org.apache.commons.lang.StringUtils;

public class RegionRealtimeSumAddAction extends CommonAction{
	private IRegionRealtimeSumAddMgmt regionRealtimeSumAddMgmt;

	public IRegionRealtimeSumAddMgmt getRegionRealtimeSumAddMgmt() {
		return regionRealtimeSumAddMgmt;
	}
	public void setRegionRealtimeSumAddMgmt(IRegionRealtimeSumAddMgmt regionRealtimeSumAddMgmt) {
		this.regionRealtimeSumAddMgmt = regionRealtimeSumAddMgmt;
	}
	

	/**
	 * 获取所有将region_realtime_log中同一个景区的不同area_code进行汇总
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionRealtimeSumAdd(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionRealtimeSumAddMgmt.queryRegionRealtimeSumAdd(new RegionRealtimeSumAdd());
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
	 * 根据条件获取将region_realtime_log中同一个景区的不同area_code进行汇总列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionRealtimeSumAddList(RegionRealtimeSumAdd regionRealtimeSumAdd){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			if("340000".equals(regionRealtimeSumAdd.getCityCode())){
				if("0".equals(regionRealtimeSumAdd.getAreacode())){
					result = regionRealtimeSumAddMgmt.queryRegionRealtimeSumAdd(regionRealtimeSumAdd);
				}else if("1".equals(regionRealtimeSumAdd.getAreacode())){
					result = regionRealtimeSumAddMgmt.queryAllcitysOut(regionRealtimeSumAdd);
				}else{
					result = regionRealtimeSumAddMgmt.queryAllcitysIn(regionRealtimeSumAdd);
				}				
			}else{
				if("0".equals(regionRealtimeSumAdd.getAreacode())){
					result = regionRealtimeSumAddMgmt.queryCityidRegionid(regionRealtimeSumAdd);
				}else if("1".equals(regionRealtimeSumAdd.getAreacode())){
					result = regionRealtimeSumAddMgmt.queryCityidRegionidOut(regionRealtimeSumAdd);
				}else{
					result = regionRealtimeSumAddMgmt.queryCityidRegionidIn(regionRealtimeSumAdd);
				}				
			}
			String json = getEchartJsonStr(result,regionRealtimeSumAdd);
			//显示同比时，获取同比数据
			if(regionRealtimeSumAdd.getShowTb()!=null&&regionRealtimeSumAdd.getShowTb().equals("yes")){
				String beginDate = regionRealtimeSumAdd.getBegindate();
				String[] dateArr = beginDate.split("-");
				int year= Integer.parseInt(dateArr[0]);
				String tbDate = (year-1) +"-"+ dateArr[1]+"-"+dateArr[2];
				regionRealtimeSumAdd.setBegindate(tbDate);
				List<RegionRealtimeSumAdd> tbResult = null;
				if("340000".equals(regionRealtimeSumAdd.getCityCode())){
					if("0".equals(regionRealtimeSumAdd.getAreacode())){
						tbResult = regionRealtimeSumAddMgmt.queryRegionRealtimeSumAdd(regionRealtimeSumAdd);
					}else if("1".equals(regionRealtimeSumAdd.getAreacode())){
						tbResult = regionRealtimeSumAddMgmt.queryAllcitysOut(regionRealtimeSumAdd);
					}else{
						tbResult = regionRealtimeSumAddMgmt.queryAllcitysIn(regionRealtimeSumAdd);
					}
				}else{
					if("0".equals(regionRealtimeSumAdd.getAreacode())){
						tbResult = regionRealtimeSumAddMgmt.queryCityidRegionid(regionRealtimeSumAdd);
					}else if("1".equals(regionRealtimeSumAdd.getAreacode())){
						tbResult = regionRealtimeSumAddMgmt.queryCityidRegionidOut(regionRealtimeSumAdd);
					}else{
						tbResult = regionRealtimeSumAddMgmt.queryCityidRegionidIn(regionRealtimeSumAdd);
					}
				}
				for(RegionRealtimeSumAdd rrs : tbResult){
					result.add(rrs);
				}
			}
			ar.setReturnObject(json);
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
	 * 对查找的结果集进行重新解析
	 * @param result
	 * @param regionRealtimeSumAdd
	 * @return
	 */
	private String getEchartJsonStr(List result,RegionRealtimeSumAdd regionRealtimeSumAdd){
		List dataTotalList = new ArrayList();
		List colList = new ArrayList();
		List dataList = new ArrayList();
		colList.add("statHour");
		colList.add("count");
		String regionName = "";
		for(int i=0;i<result.size();i++){
			RegionRealtimeSumAdd regionRealtime = (RegionRealtimeSumAdd)result.get(i);
			if(i==0){
				regionName = regionRealtime.getRegionname();
			}
			Map map = new HashMap();
			map.put("statHour", regionRealtime.getRqtime());
			map.put("count", regionRealtime.getDates());
			dataList.add(map);
		}
		dataTotalList.add(colList);
		dataTotalList.add(dataList);
		Map staticMap = new HashMap();
		String searchDate = regionRealtimeSumAdd.getBegindate();
		if(StringUtils.isNotBlank(searchDate)){
			String[] dataArr = searchDate.split("-");
			searchDate = dataArr[0]+"年"+dataArr[1]+"月"+dataArr[2]+"日";
		}
		String title = searchDate+regionName+"新增游客统计";
		staticMap.put("xname","单位（时）");
		staticMap.put("yname","单位（人次）");
		staticMap.put("caption",title);
		staticMap.put("subTitle", "统计各个景区在每个小时内新增的游客数量，可选择景点和日期查询，游客可按全部游客、外地游客、本地游客分别统计，可同比显示去年同期的统计。");
		String json = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "bar");
		return json;
	}

	/**
	 * 导出excel
	 * **/
	public ActionResult expExcel(RegionRealtimeSumAdd regionRealtimeSumAdd,String number){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getRegionRealtimeSumAddList(regionRealtimeSumAdd).getReturnList();
		if(null != list && list.size()>0){
			String[] header = {"景区名称","游客类型","查询日期","时间点","新增游客总量（人次）"};
			String title = "景区新增游客统计";
			String[][] result = new String[list.size()][header.length];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(Object object:list){
				RegionRealtimeSumAdd RegionRealtimeSumAddExp = (RegionRealtimeSumAdd)object;
				result[i][0] = RegionRealtimeSumAddExp.getRegionname();
				result[i][1] = RegionRealtimeSumAddExp.getTouristtype();
				result[i][2] = RegionRealtimeSumAddExp.getSearchdate();
				result[i][3] = RegionRealtimeSumAddExp.getRqtime();
				result[i][4] = RegionRealtimeSumAddExp.getDates();
				i++;
			}
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			try {
				if("".equals(number) || number==null || "underfind".equals(number) || number.isEmpty())
					reStr = exportExcelReport.exportReport(result, header,title);
				else
					reStr = exportExcelReport.exportReport(result, header,title,number);
				reStr1[0] = reStr[0];
				reStr1[1] = reStr[1];
				reStr1[2] = "EXPREGIONREALTIMEADD_"+reStr[1];
				ar.setResultCode(0);
				if(null!=reStr){
					ar.setReturnObject(reStr);
				}
			} catch (Exception e){
				e.printStackTrace();
				ar.setResultCode(-1);
				ar.setResultMessage(e.getMessage());
			}
		}
		return ar;
	}
	
	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser(){
		SysOperator user=super.getSessionUser();
		if(user==null){
			user=new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}