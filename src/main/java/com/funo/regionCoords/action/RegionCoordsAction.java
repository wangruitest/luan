package com.funo.regionCoords.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
 















import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.region.mgmt.IRegionCfgMgmt;
import com.funo.region.model.RegionCfg;
import com.funo.regionCoords.mgmt.IRegionCoordsMgmt;
import com.funo.regionCoords.model.RegionCoords;
import com.funo.regionCoords.model.RegionPolygon;
import com.funo.regionCoords.model.Weather;
import com.funo.regioninfo.mgmt.impl.RegionInfoMgmt;
import com.funo.regioninfo.model.RegionInfo;
import com.funo.regionrealtimesum.mgmt.impl.RegionRealtimeSumMgmt;
import com.funo.regionrealtimesum.model.RRSum;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;
import com.funo.utils.DateUtils;
import com.funo.utils.WeatherUtils;
import com.funo.weblogo.mgmt.imp.WebLogoCfgMgmt;
import com.funo.weblogo.model.WebLogoCfg;

public class RegionCoordsAction extends CommonAction{
	private IRegionCoordsMgmt regionCoordsMgmt;
	
    public IRegionCoordsMgmt getRegionCoordsMgmt() {
		return regionCoordsMgmt;
	}
	public void setRegionCoordsMgmt(IRegionCoordsMgmt regionCoordsMgmt) {
		this.regionCoordsMgmt = regionCoordsMgmt;
	}
	
	private IRegionCfgMgmt regionCfgMgmt;

	public IRegionCfgMgmt getRegionCfgMgmt() {
		return regionCfgMgmt;
	}
	public void setRegionCfgMgmt(IRegionCfgMgmt regionCfgMgmt) {
		this.regionCfgMgmt = regionCfgMgmt;
	}
	
	private RegionInfoMgmt regionInfoMgmt;
	
	public RegionInfoMgmt getRegionInfoMgmt() {
		return regionInfoMgmt;
	}
	public void setRegionInfoMgmt(RegionInfoMgmt regionInfoMgmt) {
		this.regionInfoMgmt = regionInfoMgmt;
	}
	
	private RegionRealtimeSumMgmt	regionRealtimeSumMgmt;
	
	public RegionRealtimeSumMgmt getRegionRealtimeSumMgmt() {
		return regionRealtimeSumMgmt;
	}
	public void setRegionRealtimeSumMgmt(RegionRealtimeSumMgmt regionRealtimeSumMgmt) {
		this.regionRealtimeSumMgmt = regionRealtimeSumMgmt;
	}
	
	private WebLogoCfgMgmt webLogoCfgMgmt;

	public WebLogoCfgMgmt getWebLogoCfgMgmt() {
		return webLogoCfgMgmt;
	}

	public void setWebLogoCfgMgmt(WebLogoCfgMgmt webLogoCfgMgmt) {
		this.webLogoCfgMgmt = webLogoCfgMgmt;
	}
	//private String[] cities=new String[]{"合肥市","芜湖市","蚌埠市","淮南市","马鞍山市","淮北市","铜陵市","安庆市","黄山市","滁州市","阜阳市","宿州市","六安市","亳州市","池州市","宣城市"};
	private List<String> cityNamesList=Arrays.asList("合肥市","芜湖市","蚌埠市","淮南市","马鞍山市","淮北市","铜陵市","安庆市","黄山市","滁州市","阜阳市","宿州市","六安市","亳州市","池州市","宣城市");
	/**
	 * 获取景区在园人数信息并绘制在首页中
	 * @return
	 */
	public List<RegionPolygon> getAllRegionInfo(String reginIds,String cityCode) {
		reginIds ="151115012,151115003,151115013,151115002,151115001,151115004,151115005,151115011,151115006,151115007,151115010,151115008,151115009";
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
		List<RegionPolygon> rps = new ArrayList<RegionPolygon>();
		try {
//			getSessionUser().getOtherParams().put(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
//			getSessionUser().getOtherParams().put(Constants.TEMP_ORG_CODE, city);
			RegionPolygon qRegionPolygon=new RegionPolygon();
			//String tempRegionIdIn="";
			if(StringUtils.isNotEmpty(reginIds)&&!reginIds.equals("[]")){
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
			List<WebLogoCfg> wlc =new ArrayList<WebLogoCfg>();
			wlc=webLogoCfgMgmt.queryLogoCfg();
			if(wlc.get(0).getExt2().equals("341500")){
			rps = regionCoordsMgmt.queryByLuanRegionDayView(qRegionPolygon);
			}else{
			rps = regionCoordsMgmt.queryByRegionDayView(qRegionPolygon);	
			}
			//qRegionPolygon.setDate(DateUtils.todayHourTime());
			List<RRSum> regionInSum=regionRealtimeSumMgmt.queryByRegionsForDayData(qRegionPolygon);
			if(!regionInSum.isEmpty()&&!rps.isEmpty()){
				rps.get(0).setJamValue(Integer.parseInt(String.valueOf(regionInSum.get(0).getTouristSum())));
			}
//			getSessionUser().getOtherParams().put(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
//			getSessionUser().getOtherParams().put(Constants.TEMP_ORG_CODE, city);
			//List<RegionCoords> totalRcs = regionCoordsMgmt.queryRegionCoords(new RegionCoords());
			RegionCoords regionCoords=new RegionCoords();
			regionCoords.setRegionIdIn(qRegionPolygon.getRegionIdIn());
			List<RegionCoords> totalRcs=regionCoordsMgmt.queryByRegionIdsForCoords(regionCoords);
			for(RegionPolygon rp : rps) {
				//判断该景区渲染的颜色
				/*if(rp.getAtNum() < rp.getExpediteValue()) {//畅通
					rp.setColorIndex(0);
				} else if(rp.getAtNum() >= rp.getJamValue()){//拥挤
					rp.setColorIndex(2);
				} else {//一般
					rp.setColorIndex(1);
				}*/
				Integer atNum=rp.getAtNum();
				if(atNum>=rp.getRedNum()){
					rp.setColorIndex(4);
				}else if(atNum>=rp.getOrangeNum()&&atNum<rp.getRedNum()){
					rp.setColorIndex(3);
				}else if(atNum>=rp.getYellowNum()&&atNum<rp.getOrangeNum()){
					rp.setColorIndex(2);
				}else if(atNum>=rp.getBlueNum()&&atNum<rp.getYellowNum()){
					rp.setColorIndex(1);
				}else{
					rp.setColorIndex(0);
				}
				//读取出属于该景区的经纬度信息
				List<RegionCoords> rcs = new ArrayList<RegionCoords>();
				for(RegionCoords rc : totalRcs) {
					if(rc.getRegionId().longValue() == rp.getRegionId().longValue()) {
						rcs.add(rc);
					}
				}
				//根据编号对该景区的经纬度信息进行排序
				sortRegionCoordsList(rcs);
				rp.setaRegionCoords(rcs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rps;
	}
	
	/**
	 * 
	 * 描述：地市大屏日数据获取关于打点、实时人数、预警级别等信息
	 * @param cityCode
	 * @return 
	 * @return：List<RegionPolygon>
	 * @author 吴宝龙
	 * @date： 2016年1月29日 上午11:05:07
	 */
	public List<RegionPolygon> getAllRegionInfoByCityDayView(String cityCode) {
		
		ActionResult ar=new ActionResult();
		List<RegionPolygon> rps = new ArrayList<RegionPolygon>();
		try {
			RegionPolygon qRegionPolygon=new RegionPolygon();
			qRegionPolygon.setCityId(cityCode);
			qRegionPolygon.setDate(DateUtils.nowHourTime());
			//qRegionPolygon.setDate("2015-11-16 10:00:00");
			rps = regionCoordsMgmt.queryByCityDayView(qRegionPolygon);
			List<RegionCoords> totalRcs = regionCoordsMgmt.queryRegionCoords(new RegionCoords());
			for(RegionPolygon rp : rps) {
				//判断拥挤程度
				/*if(rp.getAtNum() < rp.getExpediteValue()) {//舒适
					rp.setColorIndex(0);
				} else if(rp.getAtNum() >= rp.getJamValue()){//拥挤
					rp.setColorIndex(2);
				} else {//一般
					rp.setColorIndex(1);
				}*/
				//0-green;1-blue;2-yellow;3-orange;4-red
				Integer atNum=rp.getAtNum();
				if(atNum>=rp.getRedNum()){
					rp.setColorIndex(4);
				}else if(atNum>=rp.getOrangeNum()&&atNum<rp.getRedNum()){
					rp.setColorIndex(3);
				}else if(atNum>=rp.getYellowNum()&&atNum<rp.getOrangeNum()){
					rp.setColorIndex(2);
				}else if(atNum>=rp.getBlueNum()&&atNum<rp.getYellowNum()){
					rp.setColorIndex(1);
				}else{
					rp.setColorIndex(0);
				}
				//添加边线坐标
				List<RegionCoords> rcs = new ArrayList<RegionCoords>();
				for(RegionCoords rc : totalRcs) {
					if(rc.getRegionId().longValue() == rp.getRegionId().longValue()) {
						rcs.add(rc);
					}
				}
				//设定边线坐标
				sortRegionCoordsList(rcs);
				rp.setaRegionCoords(rcs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rps;
	}
	
	/**
	 * 
	 * 描述：获取TOP4景区的实时信息：天气、拥挤程度、在园人数
	 * @param cityCode
	 * @return 
	 * @return：List<RegionPolygon>
	 * @author 吴宝龙
	 * @date： 2016年1月29日 下午4:37:39
	 */
	public ActionResult getTOP4RegionInfoByCityDayView(String cityCode) {
		
		ActionResult ar=new ActionResult();
		List<Object> lists=new ArrayList<Object>();
		List<RegionPolygon> rps = new ArrayList<RegionPolygon>();
		try {
			RegionPolygon qRegionPolygon=new RegionPolygon();
			qRegionPolygon.setCityId(cityCode);
			qRegionPolygon.setDate(DateUtils.nowHourTime());
			//qRegionPolygon.setDate("2015-11-16 10:00:00");
			rps = regionCoordsMgmt.queryByCityDayView(qRegionPolygon);
			List<RegionCoords> totalRcs = regionCoordsMgmt.queryRegionCoords(new RegionCoords());
			for(int i=0;i<rps.size();i++) {
				if(i<4){
					RegionPolygon rp=rps.get(i);
					Map<String, Object> mapTemp=new HashMap<String, Object>();
					//mapTemp.put("regionName", rp.getRegionName().replace("", newChar));
					String cityName=rp.getRegionName();
					for (String name : cityNamesList) {
						if(cityName.contains(name)){
							cityName=cityName.replace(name, "");
							break;
						}
					}
					mapTemp.put("regionName", cityName);
					mapTemp.put("inNum", rp.getAtNum());
					Integer atNum=rp.getAtNum();
					if(atNum>=rp.getRedNum()){
						mapTemp.put("jam", "红色预警");
					}else if(atNum>=rp.getOrangeNum()&&atNum<rp.getRedNum()){
						mapTemp.put("jam", "橙色预警");
					}else if(atNum>=rp.getYellowNum()&&atNum<rp.getOrangeNum()){
						mapTemp.put("jam", "黄色预警");
					}else if(atNum>=rp.getBlueNum()&&atNum<rp.getYellowNum()){
						mapTemp.put("jam", "蓝色预警");
					}else{
						mapTemp.put("jam", "正常");
					}
					Weather weather=WeatherUtils.returnWeatherByISPScenic(String.valueOf(rp.getRegionId()));
					mapTemp.put("pm", weather.getPm25());
					mapTemp.put("wd",weather.getCurrentTemperature()+"℃"+" ("+ weather.getCurrentText()+")");
					
					lists.add(mapTemp);
				}
			}
			
			ar.setReturnList(lists);
			System.out.println(lists);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	

	public List<RegionCfg> getAllRegion() {
		ActionResult ar=new ActionResult();
		List<RegionCfg> rcs = new ArrayList<RegionCfg>();
		try {
			rcs = regionCfgMgmt.queryRegionCfg(new RegionCfg());	
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rcs;
	}
	
	public RegionPolygon getRegionInfoByRegionId(Long regionId) {
		ActionResult ar=new ActionResult();
		RegionPolygon rp = new RegionPolygon();
		try {
			//获取景区信息
			RegionCfg regionCfg = regionCfgMgmt.getRegionCfgById(regionId.toString());
			
			//获取景区的经纬度信息
			RegionCoords rc = new RegionCoords();
			rc.setRegionId(regionId);
			List<RegionCoords> rcs = regionCoordsMgmt.queryRegionCoords(rc);
			rcs = sortRegionCoordsList(rcs);
			
			
			//整合景区数据
			rp.setRegionId(regionId);
			rp.setRegionName(regionCfg.getRegionName());
			rp.setLat(regionCfg.getLat());
			rp.setLng(regionCfg.getLng());
			rp.setaRegionCoords(rcs);
			//获取景区的基站信息
//			rp.setaCellCfg(cellCfgMgmt.queryByRegion(regionId));
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return rp;
	}
	
	public ActionResult uptRegionLatLng(RegionPolygon rp) {
		ActionResult ar=new ActionResult();
		try {
			RegionCfg rc = new RegionCfg();
			rc.setId(rp.getRegionId());
			rc.setLat(rp.getLat());
			rc.setLng(rp.getLng());
			regionCfgMgmt.uptRegionLnglat(rc);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	public ActionResult uptRegionCoords(RegionPolygon rp) {
		ActionResult ar=new ActionResult();
		try {
			regionCoordsMgmt.uptRegionCoordsList(rp);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 根据编号对该景区的经纬度信息进行排序
	 * @param rcl
	 * @return
	 */
	private List<RegionCoords> sortRegionCoordsList(List<RegionCoords> rcl) {
		Collections.sort(rcl, new Comparator<RegionCoords>(){
			public int compare(RegionCoords o1, RegionCoords o2) {
				return Long.valueOf(o1.getCoordsIndex().longValue() - o2.getCoordsIndex().longValue()).intValue();
			}
		});
		return rcl;
	}
	
	/**
	 * 删除
	 */
	public ActionResult deleteRegionCoords(Long id){
		ActionResult ar=new ActionResult();
		try {
			RegionCoords rc1 = new RegionCoords();
			rc1.setRegionId(id);
			regionCoordsMgmt.deleteRegionCoords(rc1);
			RegionCfg rc = new RegionCfg();
			rc.setId(id);
			rc.setLat("");
			rc.setLng("");
			regionCfgMgmt.uptRegionLnglat(rc);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 市大屏日数据获取景区信息
	 * 描述：
	 * @param regionInfo
	 * @return 
	 * @return：String
	 * @author 吴宝龙
	 * @date： 2016年1月27日 下午3:18:16
	 */
	public ActionResult returnRegionsByLevel(RegionInfo regionInfo){
		ActionResult ar=new ActionResult();
		if(regionInfo==null){
			return null;
		}else{
			
			Map<String, Object> tempMap=new HashMap<String, Object>();
			JSONArray jsonArray=new JSONArray();
			List<Map<String, Object>> mapList=regionInfoMgmt.queryByAlevel(regionInfo);
			Integer all=0;
			int a3U=0;//3A景区级别以下的数量
			for (Map<String, Object> map2 : mapList) {
				JSONObject temp=new JSONObject();
				Integer tempLevel=Integer.parseInt(map2.get("ALEVEL").toString());
				switch(tempLevel){
				case 5:
					tempMap.put("fivel", Integer.parseInt(map2.get("Regions").toString()));
					temp.put("name", "5A");
					temp.put("value", Integer.parseInt(map2.get("Regions").toString()));
					jsonArray.put(0,temp);
					break;
				case 4:
					tempMap.put("fourl", Integer.parseInt(map2.get("Regions").toString()));
					
					temp.put("name", "4A");
					temp.put("value", Integer.parseInt(map2.get("Regions").toString()));
					jsonArray.put(1,temp);
					break;
				case 3:
					tempMap.put("threel", Integer.parseInt(map2.get("Regions").toString()));
					
					temp.put("name", "3A");
					temp.put("value", Integer.parseInt(map2.get("Regions").toString()));
					jsonArray.put(2,temp);
					break;
				case 0:
				case 1:
				case 2:
					a3U+=Integer.parseInt(map2.get("Regions").toString());
					break;
				
				}
				all+=Integer.parseInt(map2.get("Regions").toString());
			}
			//存放3A以下的景区信息
			JSONObject temp=new JSONObject();
			temp.put("name", "3A以下");
			temp.put("value", a3U);
			jsonArray.put(3,temp);
			tempMap.put("regions", all);
			tempMap.put("list", jsonArray.toString());
			tempMap.put("legend", Arrays.asList("5A","4A","3A","3A以下"));
			//JSONObject josn=JSONObject.fromMap(tempMap);
			System.out.println(jsonArray.toString());
			ar.setReturnObject(tempMap);
			return ar;
		}
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