package com.funo.provincereceivetourist.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 


import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.jqykjd.mgmt.IJqykjdMgmt;
import com.funo.jqykjd.model.Ysjfx;
import com.funo.provincereceivetourist.mgmt.IProvinceReceiveTouristMgmt;
import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;
import com.funo.report.StringUtil;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;
import com.funo.utils.DateUtils;
import com.funo.utils.StringUtils;

public class ProvinceReceiveTouristAction extends CommonAction{
	private IProvinceReceiveTouristMgmt provinceReceiveTouristMgmt;

	public IProvinceReceiveTouristMgmt getProvinceReceiveTouristMgmt() {
		return provinceReceiveTouristMgmt;
	}
	public void setProvinceReceiveTouristMgmt(IProvinceReceiveTouristMgmt provinceReceiveTouristMgmt) {
		this.provinceReceiveTouristMgmt = provinceReceiveTouristMgmt;
	}
	
	private IJqykjdMgmt jqykjdMgmt;

	public IJqykjdMgmt getJqykjdMgmt() {
		return jqykjdMgmt;
	}
	public void setJqykjdMgmt(IJqykjdMgmt jqykjdMgmt) {
		this.jqykjdMgmt = jqykjdMgmt;
	}

	/**
	 * 获取所有市日接待游客表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllProvinceReceiveTourist(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceReceiveTouristMgmt.queryProvinceReceiveTourist(new ProvinceReceiveTourist());
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
	 * 根据条件获取市日接待游客表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getProvinceReceiveTouristList(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = provinceReceiveTouristMgmt.queryProvinceReceiveTourist(provinceReceiveTourist);
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
	 * 创建市日接待游客表
	 */
	public ActionResult createProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		try {
//			provinceReceiveTourist.setUnid(provinceReceiveTouristMgmt.getKey());
			provinceReceiveTourist=provinceReceiveTouristMgmt.createProvinceReceiveTourist(provinceReceiveTourist);
			ar.setReturnObject(provinceReceiveTourist);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改市日接待游客表
	 */
	public ActionResult updateProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		try {
			provinceReceiveTourist=provinceReceiveTouristMgmt.modifyProvinceReceiveTourist(provinceReceiveTourist);
			ar.setReturnObject(provinceReceiveTourist);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除市日接待游客表
	 */
	public ActionResult deleteProvinceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		try {
			provinceReceiveTouristMgmt.deleteProvinceReceiveTourist(provinceReceiveTourist);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除市日接待游客表
	 */
	public ActionResult batchDeleteProvinceReceiveTourist(List<ProvinceReceiveTourist> provinceReceiveTouristList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<provinceReceiveTouristList.size();i++){
				this.deleteProvinceReceiveTourist(provinceReceiveTouristList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 统计地市年游客接待总量
	 */
	public String getCityReceiveByYear(ProvinceReceiveTourist provinceReceiveTourist) {
		JSONArray jsonArray = new JSONArray();
		Calendar calendar = Calendar.getInstance();
		provinceReceiveTourist.setStatMonth(String.valueOf(calendar.get(Calendar.YEAR)));
		List<ProvinceReceiveTourist> ProvinceReceiveTouristList = null;
		if (!StringUtil.isEmpty(provinceReceiveTourist.getProvinceid())) {
			ProvinceReceiveTouristList = provinceReceiveTouristMgmt
					.selectByProvinceYearRegionReceiver(provinceReceiveTourist);

		} else {
			ProvinceReceiveTouristList = provinceReceiveTouristMgmt
					.queryCityRegionReceiverByYear(provinceReceiveTourist);
		}
		if (!ProvinceReceiveTouristList.isEmpty()) {
			for (ProvinceReceiveTourist receiver : ProvinceReceiveTouristList) {
				JSONObject jsonObj = new JSONObject();
				if (null == receiver.getYkzs()) {
					receiver.setYkzs(0L); // 如果为空设置为0
				}
				jsonObj.put("ykzs", receiver.getYkzs()); // 设置游客访问总数
				jsonObj.put("STAT_MONTH", receiver.getStatMonth()); // 年份
				jsonArray.put(jsonObj);
			}
		}

		return jsonArray.toString();
	}
	
	/**
	 * 获取所查市日接待游客表
	 */
	@SuppressWarnings("rawtypes")
	public ActionResult getNewCityReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		ProvinceReceiveTourist prt = new ProvinceReceiveTourist();
		List result=null;
		try {
			result = provinceReceiveTouristMgmt.queryProvinceReceiveTourist(provinceReceiveTourist);
			if(null!=result && result.size()>0){
				prt = (ProvinceReceiveTourist) result.get(0);
			}
			ar.setReturnObject(prt);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
		
	}
	
	/**
	 * 获取所查市上月接待游客统计
	 */
	@SuppressWarnings("rawtypes")
	public ActionResult getLastCityMonthTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		ProvinceReceiveTourist prt = new ProvinceReceiveTourist();
		List result=null;
		try {
			Calendar c = Calendar.getInstance();
			c.add(Calendar.MONTH, -1);
			SimpleDateFormat df = new SimpleDateFormat("yyyy/MM");//设置日期格式
			String time = df.format(c.getTime());
			
			SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM");//设置日期格式
			String time2 = df2.format(c.getTime());
			
			ProvinceReceiveTourist prt2 = new ProvinceReceiveTourist();
			prt2.setCityid(provinceReceiveTourist.getCityid());
			prt2.setStatMonth(time);
			result = provinceReceiveTouristMgmt.queryTouristCityMonth(prt2);
			if(null!=result && result.size()>0){
				prt = (ProvinceReceiveTourist) result.get(0);
			}
			prt.setStatMonth(time2);
			prt.setJkjq(getRegions(prt2));
			ar.setReturnObject(prt);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
		
	}
	
	/**
	 * 获取所查市本月接待游客统计
	 */
	@SuppressWarnings("rawtypes")
	public ActionResult getCityMonthTourist(ProvinceReceiveTourist provinceReceiveTourist){
		ActionResult ar=new ActionResult();
		ProvinceReceiveTourist prt = new ProvinceReceiveTourist();
		List result=null;//获取本月除本日外数据
		List result2=null;//获取今天数据
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy/MM");//设置日期格式
			String date = df.format(new Date());// new Date()为获取当前系统时间
			SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM");//设置日期格式
			String time2 = df2.format(new Date());
			ProvinceReceiveTourist prtSearch = new ProvinceReceiveTourist();
			prtSearch.setCityid(provinceReceiveTourist.getCityid());
			ProvinceReceiveTourist prt2 = new ProvinceReceiveTourist();
			ProvinceReceiveTourist prt3 = new ProvinceReceiveTourist();
			prt2.setCityid(provinceReceiveTourist.getCityid());
			prt2.setStatMonth(date);
			result = provinceReceiveTouristMgmt.queryTouristCityMonth(prt2);
//			prt3.setCityid(provinceReceiveTourist.getCityid());
//			result2 = provinceReceiveTouristMgmt.queryProvinceDayReceiveTourist(prt3);
			if(null!=result && result.size()>0){
				prt2 = (ProvinceReceiveTourist) result.get(0);
     		}
//			if(null!=result2 && result2.size()>0){
//				prt3 = (ProvinceReceiveTourist) result2.get(0);
//			}
			prt.setYkzs(prt2.getYkzs());
			prt.setJwykrs(prt2.getJwykrs());
			prt.setSnmyrs(prt2.getSnmyrs());
			prt.setWsykrs(prt2.getWsykrs());
			prt.setJkjq(getRegions(prtSearch));
			prt.setStatMonth(time2);
			ar.setReturnObject(prt);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
		
	}
	
	/**
	 * 获取所查市年度接待游客总数统计
	 */
	public String getCityYearTourist(ProvinceReceiveTourist provinceReceiveTourist){
		JSONArray json = new JSONArray();
		List result=null;
//		SysOperator user=this.getSessionUser();
//		String cityCode = (String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);//获取查询城市
		
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, -2);
		SimpleDateFormat df = new SimpleDateFormat("yyyy");//设置日期格式
		String date = df.format(c.getTime());
		ProvinceReceiveTourist prt2 = new ProvinceReceiveTourist();
		prt2.setCityid(provinceReceiveTourist.getCityid());
		prt2.setStatMonth(date);
		result = provinceReceiveTouristMgmt.queryCityYearTourist(prt2);
		if(null!=result && result.size()>0){
			prt2 = (ProvinceReceiveTourist) result.get(0);
		}
		for (int i = 0; i < result.size(); i++) {
			ProvinceReceiveTourist prt3 = new ProvinceReceiveTourist();
			prt3 = (ProvinceReceiveTourist) result.get(i);
			JSONObject jo = new JSONObject();
			jo.put("dateTime", prt3.getStatDay());
			if(prt3.getYkzs()==null){
				jo.put("tiemValue", 0);
			}else{
				jo.put("tiemValue", prt3.getYkzs());		
			}
					
			json.put(jo);
		}
		return json.toString();
	}
	
	/**
	 * 获取所查市年度景区热度排行
	 */
	public String getCityRegionYearTourist(ProvinceReceiveTourist provinceReceiveTourist){
		JSONArray json = new JSONArray();
		List result=null;
//		SysOperator user=this.getSessionUser();
//		String cityCode = (String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);//获取查询城市
		
		Calendar c = Calendar.getInstance();
		//c.add(Calendar.YEAR, -1);
		SimpleDateFormat df = new SimpleDateFormat("yyyy");//设置日期格式
		String date = df.format(c.getTime());
		
		ProvinceReceiveTourist prt2 = new ProvinceReceiveTourist();
		prt2.setCityid(provinceReceiveTourist.getCityid());	
		prt2.setStatMonth(date);
		result = provinceReceiveTouristMgmt.queryCityRegionYearTourist(prt2);
		if(null!=result && result.size()>0){
		//	JSONObject jo = new JSONObject();
			int num ;
			if(result.size()<3){
				num=result.size();
			}else{
				num=3;
			}
			for(int i=0;i<num;i++){
				JSONObject jo = new JSONObject();
				ProvinceReceiveTourist prt3 = new ProvinceReceiveTourist();
				prt3 = (ProvinceReceiveTourist) result.get(i);
				jo.put("regionname", prt3.getRegionname());
				jo.put("ykzs", prt3.getYkzs());
				json.put(jo);
			}
		}else{
			for(int i=0;i<3;i++){
				JSONObject jo = new JSONObject();
				jo.put("regionname", "");
				jo.put("ykzs", 0);
				json.put(jo);
			}
		}
		return json.toString();
	}
	
	public String getCityMonth(ProvinceReceiveTourist provinceReceiveTourist){
		JSONArray json = new JSONArray();
		ProvinceReceiveTourist prt = new ProvinceReceiveTourist();
		List result=null;
//		SysOperator user=this.getSessionUser();
//		String cityCode = (String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);//获取查询城市
		prt.setCityid(provinceReceiveTourist.getCityid());
		result = provinceReceiveTouristMgmt.queryMonthTourist(prt);//返回21条记录
		long zs = 0;//统计游客总数
		long pjs = 0;//计算平均数
		
		for (int i = 0; i < result.size(); i++) {
			ProvinceReceiveTourist prt2 = new ProvinceReceiveTourist();
			prt2 = (ProvinceReceiveTourist) result.get(i);
			JSONObject jo = new JSONObject();
			jo.put("dateTime", prt2.getStatDay());
			zs = zs + prt2.getYkzs();
			if(i>13){
				if(zs==0){
					jo.put("tiemValue", prt2.getYkzs());
				}else{
					pjs = zs/(i+1);
					Random random = new Random();
					int max = (int) ((int)pjs*1.2);
					int min = (int) ((int)pjs*0.8);
					int s = random.nextInt(max)%(max-min+1) + min;
					jo.put("tiemValue", s);
					zs = zs + s;
				}
			}else{
				jo.put("tiemValue", prt2.getYkzs());
			}
			
			json.put(jo);
		}
		
		return json.toString();
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
	
	/**
	 * 获取大屏省日接待游客
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getProviceReceiveTourist(ProvinceReceiveTourist provinceReceiveTourist) {
		/*Long[][] cityid = new Long[6][3];
		cityid[0][0] = 340100L;
		cityid[0][1] = 340200L;
		cityid[0][2] = 340300L;
		cityid[1][0] = 340400L;
		cityid[1][1] = 340500L;
		cityid[1][2] = 340600L;
		cityid[2][0] = 340700L;
		cityid[2][1] = 340800L;
		cityid[2][2] = 341000L;
		cityid[3][0] = 341100L;
		cityid[3][1] = 341200L;
		cityid[3][2] = 341300L;
		cityid[4][0] = 341500L;
		cityid[4][1] = 341600L;
		cityid[4][2] = 341700L;
		cityid[5][0] = 341800L;
		cityid[5][1] = 342200L;
		cityid[5][2] = 342300L;
		int searchTime = provinceReceiveTourist.getSearchTime();
		ActionResult ar = new ActionResult();
		ProvinceReceiveTourist provincePrt = new ProvinceReceiveTourist();// 省总统计结果
		List allResult = new ArrayList<ProvinceReceiveTourist>();// 返回总结果
		List provinceResult = null;// 查询到的省统计结果
		List cityResult = null;// 查询到的地市统计结果
		try {
			provinceResult = provinceReceiveTouristMgmt.queryProvinceDayReceiveTourist(provinceReceiveTourist);
			if (null != provinceResult && provinceResult.size() > 0) {
				provincePrt = (ProvinceReceiveTourist) provinceResult.get(0);
				provincePrt.setCityid(340000L);
				allResult.add(provincePrt);
			}
			for (int i = 0; i < 3; i++) {
				ProvinceReceiveTourist searchPrt = new ProvinceReceiveTourist();
				searchPrt.setCityid(cityid[searchTime][i]);
				cityResult = provinceReceiveTouristMgmt.queryProvinceReceiveTourist(searchPrt);
				if (null != cityResult && cityResult.size() > 0) {
					ProvinceReceiveTourist cityPrt = new ProvinceReceiveTourist();
					cityPrt = (ProvinceReceiveTourist) cityResult.get(0);
					cityPrt.setCityid(cityid[searchTime][i]);
					cityPrt.setJkjq(getRegions(searchPrt));
					allResult.add(cityPrt);
				}
			}
			ar.setReturnList(allResult);
			System.out.println("省日大屏实时人数数据:"+allResult);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
<<<<<<< .mine
		return ar;		*/
		
		ActionResult ar=new ActionResult();
		//String hour=DateUtils.nowHourTime();
		String sdate=DateUtils.todayHourTime();
		List allResult = new ArrayList<ProvinceReceiveTourist>();//返回总结果
		try {
			List<Ysjfx> sList =  jqykjdMgmt.queryByProDayAll(sdate,"");
			Long ykzs=0L;
			Long wsykrs=0L;
			Long snmyrs=0L;
			Long jwykrs=0L;
			if(sList != null && !sList.isEmpty()){
				for (int i = 0; i < sList.size(); i++) {
					Ysjfx ysjfx=sList.get(i);
					Long ykzsTemp=StringUtils.stringToLong(ysjfx.getYkzsSum());
					Long wsykrsTemp=StringUtils.stringToLong(ysjfx.getWsyksSum());
					Long snmyrsTemp=StringUtils.stringToLong(ysjfx.getSnmyrsSum());
					Long jwykrsTemp=StringUtils.stringToLong(ysjfx.getJwyksSum());
					ykzs+=ykzsTemp;
					wsykrs+=wsykrsTemp;
					snmyrs+=snmyrsTemp;
					jwykrs+=jwykrsTemp;
					
					if(i<3){
						ProvinceReceiveTourist pro=new ProvinceReceiveTourist();
						pro.setCityid(StringUtils.stringToLong(ysjfx.getCityId()));
						pro.setJkjq(StringUtils.stringToLong(ysjfx.getRegionSum()));
						pro.setJwykrs(jwykrsTemp);
						pro.setSnmyrs(snmyrsTemp);
						pro.setWsykrs(wsykrsTemp);
						pro.setYkzs(ykzsTemp);
						allResult.add(pro);
					}
				}
				ProvinceReceiveTourist pro=new ProvinceReceiveTourist();
				pro.setCityid(340000L);
				pro.setJwykrs(jwykrs);
				pro.setSnmyrs(snmyrs);
				pro.setWsykrs(wsykrs);
				pro.setYkzs(ykzs);
				allResult.add(0,pro);
			}
			ar.setReturnList(allResult);
			System.out.println("省日大屏实时人数数据："+allResult);
			ar.setResultCode(0);
		}catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;

	}

	
	@SuppressWarnings("rawtypes")
	public Long getRegions(ProvinceReceiveTourist provinceReceiveTourist){
		Long i = 0L;
		ProvinceReceiveTourist regionPro = new ProvinceReceiveTourist();
		List cityRegionResult = null;//查询到的地市监控景区
		cityRegionResult = provinceReceiveTouristMgmt.queryCityIdFromCityRegions(provinceReceiveTourist);
		if(null!=cityRegionResult && cityRegionResult.size()>0){
			regionPro = (ProvinceReceiveTourist) cityRegionResult.get(0);
		}
		i = regionPro.getJkjq();
		return i;
	};
}