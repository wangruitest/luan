package com.funo.regionrealtimesum.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionrealtimesum.mgmt.IRegionRealtimeSumMgmt;
import com.funo.regionrealtimesum.model.ForeignCities;
import com.funo.regionrealtimesum.model.RegionRealtimeSum;
import com.funo.regionrealtimesumadd.model.RegionRealtimeSumAdd;
import com.funo.report.EcharReportUtil;
import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;
import com.funo.utils.DateUtils;
import com.google.gson.JsonObject;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;

public class RegionRealtimeSumAction extends CommonAction{
	private IRegionRealtimeSumMgmt regionRealtimeSumMgmt;

	public IRegionRealtimeSumMgmt getRegionRealtimeSumMgmt() {
		return regionRealtimeSumMgmt;
	}
	public void setRegionRealtimeSumMgmt(IRegionRealtimeSumMgmt regionRealtimeSumMgmt) {
		this.regionRealtimeSumMgmt = regionRealtimeSumMgmt;
	}
	

	/**
	 * 获取所有将region_realtime_log中同一个景区的不同area_code进行汇总
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionRealtimeSum(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionRealtimeSumMgmt.queryRegionRealtimeSum(new RegionRealtimeSum());
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
	public ActionResult getRegionRealtimeSumList(RegionRealtimeSum regionRealtimeSum){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			if("340000".equals(regionRealtimeSum.getCityCode())){
				result = regionRealtimeSumMgmt.queryAllCitys(regionRealtimeSum);
			}else{
				result = regionRealtimeSumMgmt.queryCityidRegionid(regionRealtimeSum);
			}
			String[] json = getEchartJsonStr(result,regionRealtimeSum);
			if(regionRealtimeSum.getShowTb()!=null&&regionRealtimeSum.getShowTb().equals("yes")){
				String beginDate = regionRealtimeSum.getBegindate();
				String[] dateArr = beginDate.split("-");
				int year= Integer.parseInt(dateArr[0]);
				String tbDate = (year-1) +"-"+ dateArr[1]+"-"+dateArr[2];
				regionRealtimeSum.setBegindate(tbDate);
				List<RegionRealtimeSum> tbResult = null;
				if("340000".equals(regionRealtimeSum.getCityCode())){
					tbResult = regionRealtimeSumMgmt.queryAllCitys(regionRealtimeSum);
				}else{
					tbResult = regionRealtimeSumMgmt.queryCityidRegionid(regionRealtimeSum);
				}
				for(RegionRealtimeSum rrs : tbResult){
					result.add(rrs);
				}
			}
			//获取服务器当前时间信息
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
	 * @param regionRealtimeSum
	 * @return
	 */
	private String[] getEchartJsonStr(List result,RegionRealtimeSum regionRealtimeSum){
		List dataTotalList = new ArrayList();
		List colList = new ArrayList();
		List dataList = new ArrayList();
		colList.add("statHour");
		colList.add("本地游客");
		colList.add("省内游客");
		colList.add("省外游客");
		String regionName = "";
		for(int i=0;i<result.size();i++){
			RegionRealtimeSum regionRealtime = (RegionRealtimeSum)result.get(i);
			if(i==0){
				regionName = regionRealtime.getRegionname();
			}
			Map map = new HashMap();
			map.put("statHour", regionRealtime.getRqtime());
			map.put("本地游客", regionRealtime.getLocalstourists());
			map.put("省内游客",regionRealtime.getInstourists());
			map.put("省外游客",regionRealtime.getOutstourists());
			dataList.add(map);
		}
		dataTotalList.add(colList);
		dataTotalList.add(dataList);
		Map staticMap = new HashMap();
		String searchDate = regionRealtimeSum.getBegindate();
		if(StringUtils.isNotBlank(searchDate)){
			String[] dataArr = searchDate.split("-");
			searchDate = dataArr[0]+"年"+dataArr[1]+"月"+dataArr[2]+"日";
		}
		String title = searchDate+regionName+"实时流量分析";
		staticMap.put("xname","单位（时）");
		staticMap.put("yname","点位（人次）");
		staticMap.put("caption",title);
		staticMap.put("subTitle", "统计显示各个景区在整点时间的实时在园游客数量，可选择景点和日期查询，可同比显示去年同期的统计。");
		String[] jsonArr = new String[2];
		jsonArr[0] = EcharReportUtil.getMSBarAndLineChartJson(dataTotalList, staticMap, "bar");
		jsonArr[1] = EcharReportUtil.getMSBarAndLineChartJson(dataTotalList, staticMap, "line");
		return jsonArr;
	}

	/**
	 * 导出excel
	 * **/
	public ActionResult expExcel(RegionRealtimeSum regionRealtimeSum,String number){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getRegionRealtimeSumList(regionRealtimeSum).getReturnList();
		if(null != list && list.size()>0){
			String[] header = {"景区名称","查询日期","时间点","本地游客","省内游客","省外游客","游客总量（人次）"};
			String title = "景区实时流量分析";
			String[][] result = new String[list.size()][header.length];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(Object object:list){
				RegionRealtimeSum RegionRealtimeSumExp = (RegionRealtimeSum)object;
				result[i][0] = RegionRealtimeSumExp.getRegionname();
				result[i][1] = RegionRealtimeSumExp.getSearchdate();
				result[i][2] = RegionRealtimeSumExp.getRqtime();
				result[i][3] = RegionRealtimeSumExp.getLocalstourists();
				result[i][4] = RegionRealtimeSumExp.getInstourists();
				result[i][5] = RegionRealtimeSumExp.getOutstourists();
				result[i][6] = RegionRealtimeSumExp.getStourists();
				i++;
			}
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			try {
				reStr = exportExcelReport.exportReport(result, header,title,number);
				reStr1[0] = reStr[0];
				reStr1[1] = reStr[1];
				reStr1[2] = "EXPREGIONREALTIME_"+reStr[1];
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
	
	public ActionResult expExcel1(ForeignCities foreignCities,String number){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getForeignCities(foreignCities).getReturnList();
		if(null != list && list.size()>0){
			String[] header = {"景区名称","地区名称","游客数量（人次）"};
			String title = foreignCities.getRegionName()+"省外游客来源地统计";
			String[][] result = new String[list.size()][header.length];
			String[] reStr = null;
			String[] reStr1 = new String[2];
			int i = 0;
			for(Object object:list){
				ForeignCities RegionRealtimeSumExp = (ForeignCities)object;
				result[i][1] = RegionRealtimeSumExp.getCity();
				result[i][2] = RegionRealtimeSumExp.getSumtourists();
				//result[i][2] = RegionRealtimeSumExp.getTime();
				result[i][0] = RegionRealtimeSumExp.getRegionName();
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
				//reStr1[2] = "EXPREGIONREALTIME_"+reStr[1];
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
	 * 市日-景区实时
	 * **/
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRealtimeList(RegionRealtimeSum regionRealtimeSum){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionRealtimeSumMgmt.queryRealtimeList(regionRealtimeSum);
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
	 * 
	 * 描述：获取地市大屏日数据：接待总数据
	 * @param regionRealtimeSum
	 * @return 
	 * @return：Object
	 * @author 吴宝龙
	 * @date： 2016年1月28日 上午10:43:05
	 */
	public ActionResult getCityRealTimeListForDaPing(String cityCode){
		
		ActionResult ar=new ActionResult();
		/*int hour=Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String today=DateUtils.formatDate(new Date(), "yyyy-MM-dd");*/
		//String today="2015-11-18";
		RegionRealtimeSum regionRealtimeSum=new RegionRealtimeSum();
		regionRealtimeSum.setCityCode(cityCode);
		regionRealtimeSum.setBegindate(DateUtils.todayHourTime());
		@SuppressWarnings("serial")
		Map<String, Object> mapResult=new HashMap<String, Object>(){
			{
				put("realSum", 0);
				put("allSum", 0);
				put("outProSum", 0);
				put("inProSum", 0);
				put("outCouSum", 0);
			}
		};
		Long outCountrySumL=0L;
		Long inProSumL=0L;
		Long outProSumL=0L;
		Long totalSumL=0L;
		Long outProSumLTotal=0L;
		List<RegionRealtimeSum> list= regionRealtimeSumMgmt.queryByAllDay(regionRealtimeSum);
//		for (RegionRealtimeSum regionRealtimeSumTemp : list) {
//			if(regionRealtimeSumTemp!=null&&regionRealtimeSumTemp.getCityCode()!=null){
//				//境外游客
//				outCountrySumL=Long.parseLong( regionRealtimeSumTemp.getOutcountrytourists()==null?
//						"0": regionRealtimeSumTemp.getOutcountrytourists());
//				//省内游客
//				inProSumL=regionRealtimeSumTemp.getInTourists()==null?
//						0L: regionRealtimeSumTemp.getInTourists();
//				Long temp=Long.parseLong( regionRealtimeSumTemp.getInstourists()==null?
//						"0": regionRealtimeSumTemp.getInstourists());
//				outProSumL=Long.parseLong( regionRealtimeSumTemp.getOutstourists()==null?
//						"0": regionRealtimeSumTemp.getOutstourists());
//				outProSumLTotal+=outProSumL;
//				totalSumL+=temp;
//				totalSumL+=outCountrySumL;
//			}else{
//				//省外游客
//				outProSumL=Long.parseLong( regionRealtimeSumTemp.getOutstourists()==null?
//						"0": regionRealtimeSumTemp.getOutstourists());
//				outProSumLTotal+=outProSumL;
//				//map.put(regionRealtimeSumTemp.getRegionname(), outProSumL);
//				totalSumL+=outProSumL;
//			}
//		}
		totalSumL=Long.parseLong(list.get(0).getInstourists());
		outProSumLTotal=Long.parseLong(list.get(0).getOutstourists());
		inProSumL=Long.parseLong(list.get(0).getOutcountrytourists());
		outCountrySumL=list.get(0).getInTourists();
		mapResult.put("allSum", totalSumL);
		mapResult.put("outProSum", outProSumLTotal);
		mapResult.put("inProSum", inProSumL);
		mapResult.put("outCouSum", outCountrySumL);
		ar.setReturnObject(mapResult);
		return ar;
	}
	
	/**
	 * 
	 * 描述：返回地市大屏日数据：Line报表的数据
	 * @param cityCode
	 * @return 
	 * @return：String
	 * @author 吴宝龙
	 * @date： 2016年2月1日 下午3:34:56
	 */
	public String returnRealLineData(String cityCode){
		
		ActionResult ar=new ActionResult();
		String today=DateUtils.formatDate(new Date(), "yyyy-MM-dd");
		//String today="2015-11-18";
		RegionRealtimeSum regionRealtimeSum=new RegionRealtimeSum();
		regionRealtimeSum.setCityCode(cityCode);
		regionRealtimeSum.setBegindate(today);
		Long outCountrySumL=0L;
		Long inProSumL=0L;
		Long outProSumL=0L;
		Long totalSumL=0L;
		JSONArray array=new JSONArray();
		Map<String, Object> map=new HashMap<String, Object>();
		List<RegionRealtimeSum> list= regionRealtimeSumMgmt.queryByCityCodeForDaPing(regionRealtimeSum);
		for (RegionRealtimeSum regionRealtimeSum2 : list) {
			JSONObject json=new JSONObject();
			/*outCountrySumL=stringToLong(regionRealtimeSum2.getOutcountrytourists());
			inProSumL=stringToLong(regionRealtimeSum2.getInstourists());
			outProSumL=stringToLong(regionRealtimeSum2.getOutstourists());*/
			totalSumL=stringToLong(regionRealtimeSum2.getOutcountrytourists())+stringToLong(regionRealtimeSum2.getInstourists())
					+stringToLong(regionRealtimeSum2.getLocalstourists())+stringToLong(regionRealtimeSum2.getOutstourists());
			json.put("time", regionRealtimeSum2.getRqtime());
			json.put("timeValue",totalSumL );
			array.put(json);
		}
		//ar.setReturnObject(array.toString());
		System.out.println("实时数据："+array.toString());
		return array.toString();
	}
	
	private Long stringToLong(String str){
		Long l=0L;
		try {
			l=Long.parseLong(str);
			return l;
		} catch (Exception e) {
			// TODO: handle exception
			return l;
		}
	}
	
	/**
	 * 
	 * 描述：地市日大屏数据：游客归属地统计
	 * @param cityCode
	 * @return 
	 * @return：ActionResult
	 * @author 吴宝龙
	 * @date： 2016年1月28日 下午4:28:17
	 */
	public ActionResult getRealTimeFromByCity(String cityCode){
		ActionResult ar=new ActionResult();
		String today=DateUtils.formatDate(new Date(), "yyyy-MM-dd");
		//String today="2015-11-18 10:00:00";
		//int hour=Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		RegionRealtimeSum regionRealtimeSum=new RegionRealtimeSum();
		regionRealtimeSum.setCityCode(cityCode);
		regionRealtimeSum.setBegindate(today);
		ActionResult arr= getCityRealTimeListForDaPing(cityCode);
		Map<String, Object> maptemp=(Map<String, Object>) arr.getReturnObject();
		/*Long outCountrySumL=maptemp.get("");
		Long inProSumL=0L;
		Long outProSumL=0L;
		Long totalSumL=0L;
		Long outProSumLTotal=0L;*/
		JSONArray jsonArray=new JSONArray();
		/*Map<String, Object> map=new HashMap<String, Object>();*/
		/*for (RegionRealtimeSum regionRealtimeSumTemp : list) {
			if(regionRealtimeSumTemp!=null&&regionRealtimeSumTemp.getCityCode()!=null){
				outCountrySumL=Long.parseLong( regionRealtimeSumTemp.getOutcountrytourists()==null?
						"0": regionRealtimeSumTemp.getOutcountrytourists());
				inProSumL=Long.parseLong( regionRealtimeSumTemp.getInstourists()==null?
						"0": regionRealtimeSumTemp.getInstourists());
				JSONObject jsWai=new JSONObject();
				JSONObject jsNei=new JSONObject();
				jsWai.put("name", "境外");
				jsWai.put("value", outCountrySumL);
				//map.put("境外", outCountrySumL);
				jsNei.put("name", "本省");
				jsNei.put("value", inProSumL);
				jsonArray.put(jsWai);
				jsonArray.put(jsNei);
				totalSumL+=inProSumL;
				totalSumL+=outCountrySumL;
			}else{
				outProSumL=Long.parseLong( regionRealtimeSumTemp.getOutstourists()==null?
						"0": regionRealtimeSumTemp.getOutstourists());
				outProSumLTotal+=outProSumL;
				//map.put(regionRealtimeSumTemp.getRegionname(), outProSumL);
				totalSumL+=outProSumL;
			}
			
		}*/
		JSONObject jsOutCou=new JSONObject();
		//jsOutCou.put("name", "境外");
		jsOutCou.put("name", "本地");
		jsOutCou.put("value", maptemp.get("outCouSum"));
		jsonArray.put(0,jsOutCou);
		JSONObject jsPro=new JSONObject();
		//jsPro.put("name", "省外");
		jsPro.put("name", "本省外地");
		jsPro.put("value", maptemp.get("outProSum"));
		jsonArray.put(1,jsPro);
		JSONObject jsInPro=new JSONObject();
		//jsInPro.put("name", "本省");
		jsInPro.put("name", "省外");
		jsInPro.put("value", maptemp.get("inProSum"));
		jsonArray.put(2,jsInPro);
		Map<String, Object> mapTemp=new HashMap<String, Object>();
		mapTemp.put("list", jsonArray.toString());
		mapTemp.put("total", maptemp.get("allSum"));
		//mapTemp.put("legend", Arrays.asList("境外","本省","省外"));
		mapTemp.put("legend", Arrays.asList("本地","省外","本省外地"));
		//JSONObject objInp=new JSONObject("\"境外\":"+outCountrySumL);
		
		ar.setReturnObject(mapTemp);
		
		System.out.println("获取到的数据："+ar.getReturnObject());
		return ar;
	}
	
	public ActionResult queryByProvinceForDaPing(){
		
		ActionResult  ar=new ActionResult();
		
		int hour=Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String today="2015-11-18";
		RegionRealtimeSum regionRealtimeSum=new RegionRealtimeSum();
		regionRealtimeSum.setBegindate(today);
		@SuppressWarnings("serial")
		Map<String, Object> mapResult=new HashMap<String, Object>(){
			{
				put("realSum", 0);
				put("ykzs", 0);
				put("wsykrs", 0);
				put("snmyrs", 0);
				put("jwykrs", 0);
				put("cityid", 0);
			}
		};
		List<RegionRealtimeSum> list= regionRealtimeSumMgmt.queryByProvinceForDaPing(regionRealtimeSum);
		for (RegionRealtimeSum regionRealtimeSum2 : list) {
			//Long realSumL=regionRealtimeSum2.getStourists()==null?0L:Long.parseLong( regionRealtimeSum2.getStourists());
			if(regionRealtimeSum2.getRqtime()==String.valueOf(hour)||
					regionRealtimeSum2.getRqtime().equals(String.valueOf(hour))){
				//本地游客总数
				Long LocalSumL=regionRealtimeSum2.getLocalstourists()==null?0L:Long.parseLong(regionRealtimeSum2.getLocalstourists());
				//外省游客总数
				Long outProLSumL=regionRealtimeSum2.getOutstourists()==null?0L:Long.parseLong(regionRealtimeSum2.getOutstourists());
				//本省游客总数（除本地）
				Long inProSumL=regionRealtimeSum2.getInstourists()==null?0L:Long.parseLong(regionRealtimeSum2.getInstourists());
				//国外游客总数
				Long outCouSumL=regionRealtimeSum2.getOutcountrytourists()==null?0L:Long.parseLong(regionRealtimeSum2.getOutcountrytourists());
				//实时游客总数=国内+国外
				Long realSumL=LocalSumL+inProSumL+outProLSumL+outCouSumL;
				mapResult.put("realSum", realSumL);
				mapResult.put("ykzs", Long.parseLong(mapResult.get("ykzs").toString())+realSumL);
				mapResult.put("wsykrs", Long.parseLong(mapResult.get("wsykrs").toString())+outProLSumL);
				mapResult.put("snmyrs", Long.parseLong(mapResult.get("snmyrs").toString())+inProSumL+LocalSumL);
				mapResult.put("jwykrs", Long.parseLong(mapResult.get("jwykrs").toString())+outCouSumL);
				mapResult.put("cityid", 340000);
			}
			
		}
		List<Object> listRe=new ArrayList<Object>();
		listRe.add(mapResult);
		ar.setReturnList(listRe);
		return ar;
	}
	
	
	/**
	 * 
	 * 描述：根据RegionIDs来获取景区得实时人数
	 * @param reginIds
	 * @param cityCode
	 * @return 
	 * @return：ActionResult
	 * @author 邓林峰
	 * @date： 2016年3月7日 上午11:09:35
	 */
	public ActionResult getQtimeDatasForLineByRegionCodes(String reginIds,String cityCode){
		Object o = getSessionUser().getOtherParams().get(Constants.CUR_CHOOSE_CITY);
		String city = "";
		if(o == null) {
			city=this.getSessionUser().getChildOrgs().get(0).getCode();
		} else if(o.toString().equals("")) {
			city = this.getSessionUser().getChildOrgs().get(0).getCode();
		} else {
			city = o.toString();
		}
		if(StringUtils.isNotEmpty(cityCode)){
			city=cityCode;
		}
		ActionResult ar=new ActionResult();
		List<RegionRealtimeSum> rps = new ArrayList<RegionRealtimeSum>();
		try {
//			getSessionUser().getOtherParams().put(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
//			getSessionUser().getOtherParams().put(Constants.TEMP_ORG_CODE, city);
			RegionPolygon qRegionPolygon=new RegionPolygon();
			if(StringUtils.isNotEmpty(reginIds)){
				String[] reginIdsSplit=reginIds.split(",");
				String reginIdIn="'";
				for (int i = 0; i < reginIdsSplit.length; i++) {
					reginIdIn+=reginIdsSplit[i]+"','";
				}
				reginIdIn+="'";
				qRegionPolygon.setRegionIdIn(reginIdIn);
			}else{
				qRegionPolygon.setRegionIdIn("''");
			}
			rps=regionRealtimeSumMgmt.queryByRegionsForLine(qRegionPolygon);
			List<Object> listReturn=new ArrayList<Object>();
			List<Integer> xdata=new ArrayList<Integer>();
			List<Integer> ydata=new ArrayList<Integer>();
			for (RegionRealtimeSum regionRealtimeSum : rps) {
				ydata.add(Integer.parseInt( regionRealtimeSum.getInstourists()));
				xdata.add(Integer.parseInt(regionRealtimeSum.getRqtime()));
			}
			listReturn.add(xdata);
			listReturn.add(ydata);
			ar.setReturnList(listReturn);
		}catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		
		return  ar;
	}
	
	public ActionResult getForeignCities(ForeignCities foreignCities){
		ActionResult ar=new ActionResult();
		List result=null;
		List<ForeignCities> tbResult = null;
		ForeignCities cities = new ForeignCities();
		cities.setRegionId(foreignCities.getRegionId());
		cities.setProvinces_code(foreignCities.getProvinces_code());
		cities.setSearchType(foreignCities.getSearchType());
		cities.setBeginTime(foreignCities.getBeginTime());
		cities.setEndTime(foreignCities.getEndTime());
		cities.setRegionName(foreignCities.getRegionName());
		try {
			result = regionRealtimeSumMgmt.queryByForeignCities(cities);
			String[] json = getEchartJsonStr1(result,cities);
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
	
	private String[] getEchartJsonStr1(List result,ForeignCities foreignCities){
		List dataTotalList = new ArrayList();
		List colList = new ArrayList();
		List dataList = new ArrayList();
		colList.add("city");
		colList.add("sumtourists");
		String city = "";
		System.out.println();
		for(int i=0;i<result.size();i++){
			ForeignCities foreignCitiesinfor = (ForeignCities)result.get(i);
//			if(i==0){
//				city = foreignCitiesinfor.getCity();
//			}
			Map map = new HashMap();
			map.put("sumtourists", foreignCitiesinfor.getSumtourists());
			map.put("city", foreignCitiesinfor.getCity());
			dataList.add(map);
		}
		dataTotalList.add(colList);
		dataTotalList.add(dataList);
		Map staticMap = new HashMap();
		String title = foreignCities.getBeginTime() + " ~ " + foreignCities.getEndTime() + foreignCities.getRegionName()+"省外游客来源地统计";
		staticMap.put("xname","单位（市）");
		staticMap.put("yname","单位（人次）");
		staticMap.put("caption",title);
		staticMap.put("subTitle", "针对各个景区，按照来源地进行统计游客数量，可按年、月、天统计。");
		String[] jsonArr = new String[2];
		jsonArr[0] = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "bar");
		jsonArr[1] = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "line");
		//String json = EcharReportUtil.getSingleBarAndLineChartJsonStr(dataTotalList, staticMap, "bar");
		return jsonArr;
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