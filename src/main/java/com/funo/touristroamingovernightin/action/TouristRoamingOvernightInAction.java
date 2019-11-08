package com.funo.touristroamingovernightin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.region.model.Areas;
import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.touristroamingin.model.TouristRomaingIn2;
import com.funo.touristroamingovernightin.mgmt.ITouristRoamingOvernightInMgmt;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernight;
import com.funo.touristroamingovernightin.model.TouristRoamingOvernightIn;
import com.funo.utils.Constants;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TouristRoamingOvernightInAction extends CommonAction {
	private ITouristRoamingOvernightInMgmt touristRoamingOvernightInMgmt;

	public ITouristRoamingOvernightInMgmt getTouristRoamingOvernightInMgmt() {
		return touristRoamingOvernightInMgmt;
	}

	public void setTouristRoamingOvernightInMgmt(
			ITouristRoamingOvernightInMgmt touristRoamingOvernightInMgmt) {
		this.touristRoamingOvernightInMgmt = touristRoamingOvernightInMgmt;
	}

	/**
	 * 获取所有外省手机漫游用户到闽过夜情况表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllTouristRoamingOvernightIn() {
		ActionResult ar = new ActionResult();
		List result = null;
		try {
			result = touristRoamingOvernightInMgmt
					.queryTouristRoamingOvernightIn(new TouristRoamingOvernightIn());
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
	 * 根据条件获取外省手机漫游用户到闽过夜情况表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getTouristRoamingOvernightInList(
			TouristRoamingOvernightIn touristRoamingOvernightIn) {
		ActionResult ar = new ActionResult();
		List result = null;
		try {
			result = touristRoamingOvernightInMgmt
					.queryTouristRoamingOvernightIn(touristRoamingOvernightIn);
			if(result.size()<1){
				ar.setReturnList(result);
				ar.setResultCode(2);
			}else{
				if (null != result && result.size() > 0) {
					result = dislodgeIllegalData(result);// 去除非法数据
					result.add(totalRoamingOvernightIn(result));// 添加合计
				}
				ar.setReturnList(result);
				ar.setResultCode(0);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String getTouristRoamingOvernightInList2(TouristRomaingIn2 touristRomaingIn){
		String result="{";
		SysOperator user = getSessionUser();
		String type = user.getCountyCode();
		List resultList = null;
		String[] titleArr = touristRomaingIn.getSearchDestination().split(",");
		try {
			if(type != null && type!="0" && type != ""){
				touristRomaingIn.setType("2");
			}else{
				touristRomaingIn.setType("1");
			}
			resultList = touristRoamingOvernightInMgmt.queryTouristByCitysMonth(touristRomaingIn);
			if(resultList.size()<1){
				result += "resultCode:'2'";
			}else{
				if(null != resultList && resultList.size()>0){
					result += "resultCode:'0',returnList:[";
					Map<String,String> resultMap = groupByCity(resultList);
					Set<String> resultSet = resultMap.keySet();
					for (String str : resultSet) {
						result += ("{" + resultMap.get(str) + "},");
					}
					
					result = result.substring(0,result.length()-1)+"]";
				}
			}
			result += "}";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public Map<String,String> groupByCity(List<TouristRomaingIn2> list){
		Map<String,String> map = new HashMap<String,String>();
		for (int i = 0; i < list.size(); i++) {
				if(map.get(list.get(i).getCityid())==null){
					String item = "cityname:'"+list.get(i).getCity()+
							"',"+list.get(i).getDestination()+":'"+list.get(i).getSumroam()+"'";
					map.put(list.get(i).getCityid(), item);
				}else{
					String item = map.get(list.get(i).getCityid())+","+list.get(i).getDestination()+":'"+list.get(i).getSumroam()+"'";
					map.put(list.get(i).getCityid(), item);
				}
		}
		return map;
	}
	// 统计合计总数
	@SuppressWarnings({ "rawtypes" })
	public TouristRoamingOvernight totalRoamingOvernightIn(List list) {
		Long totalsum = 0l;
		Long totalhfroam = 0l;// 合肥市合计
		Long totalwhroam = 0l;// 芜湖市合计
		Long totalbbroam = 0l;// 蚌埠市合计
		Long totalhnroam = 0l;// 淮南市合计
		Long totalmasroam = 0l;// 马鞍山市合计
		Long totalhbroam = 0l;// 淮北市合计
		Long totaltlroam = 0l;// 铜陵市合计
		Long totalaqroam = 0l;// 安庆市合计
		Long totalhsroam = 0l;// 黄山市合计
		Long totalchuzroam = 0l;// 滁州市合计
		Long totalfyroam = 0l;// 阜阳市合计
		Long totalszroam = 0l;// 宿州市合计
		Long totallaroam = 0l;// 六安市合计
		Long totalhzroam = 0l;// 亳州市合计
		Long totalchizroam = 0l;// 池州市合计
		Long totalxcroam = 0l;// 宣城市合计
		TouristRoamingOvernight tr = new TouristRoamingOvernight();
		for (int j = 0; j < list.size(); j++) {
			TouristRoamingOvernight trr = (TouristRoamingOvernight) list.get(j);
			totalsum += trr.getSumroam() == null ? 0l : trr.getSumroam();
			totalhfroam += trr.getHfroam() == null ? 0l : trr.getHfroam();
			totalwhroam += trr.getWhroam() == null ? 0l : trr.getWhroam();
			totalbbroam += trr.getBbroam() == null ? 0l : trr.getBbroam();
			totalhnroam += trr.getHnroam() == null ? 0l : trr.getHnroam();
			totalmasroam += trr.getMasroam() == null ? 0l : trr.getMasroam();
			totalhbroam += trr.getHbroam() == null ? 0l : trr.getHbroam();
			totaltlroam += trr.getTlroam() == null ? 0l : trr.getTlroam();
			totalaqroam += trr.getAqroam() == null ? 0l : trr.getAqroam();
			totalhsroam += trr.getHsroam() == null ? 0l : trr.getHsroam();
			totalchuzroam += trr.getChuzroam() == null ? 0l : trr.getChuzroam();
			totalfyroam += trr.getFyroam() == null ? 0l : trr.getFyroam();
			totalszroam += trr.getSzroam() == null ? 0l : trr.getSzroam();
			totallaroam += trr.getLaroam() == null ? 0l : trr.getLaroam();
			totalhzroam += trr.getHzroam() == null ? 0l : trr.getHzroam();
			totalchizroam += trr.getChizroam() == null ? 0l : trr.getChizroam();
			totalxcroam += trr.getXcroam() == null ? 0l : trr.getXcroam();
		}
		tr.setAreaname("总计");
		tr.setSumroam(totalsum);
		tr.setHfroam(totalhfroam);
		tr.setWhroam(totalwhroam);
		tr.setBbroam(totalbbroam);
		tr.setHnroam(totalhnroam);
		tr.setMasroam(totalmasroam);
		tr.setHbroam(totalhbroam);
		tr.setTlroam(totaltlroam);
		tr.setAqroam(totalaqroam);
		tr.setHsroam(totalhsroam);
		tr.setChuzroam(totalchuzroam);
		tr.setFyroam(totalfyroam);
		tr.setSzroam(totalszroam);
		tr.setLaroam(totallaroam);
		tr.setHzroam(totalhzroam);
		tr.setChizroam(totalchizroam);
		tr.setXcroam(totalxcroam);
		return tr;
	}

	/**
	 * 去除本地游客数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List dislodgeIllegalData(List list) {
		List dislodgeIllegalList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			TouristRoamingOvernight tro = (TouristRoamingOvernight) list.get(i);
			if ("合肥市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getHfroam() == null ? 0l : tro.getHfroam()));
				tro.setHfroam(null);
			} else if ("芜湖市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getWhroam() == null ? 0l : tro.getWhroam()));
				tro.setWhroam(null);
			} else if ("蚌埠市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getBbroam() == null ? 0l : tro.getBbroam()));
				tro.setBbroam(null);
			} else if ("淮南市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getHnroam() == null ? 0l : tro.getHnroam()));
				tro.setHnroam(null);
			} else if ("马鞍山市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getMasroam() == null ? 0l : tro.getMasroam()));
				tro.setMasroam(null);
			} else if ("淮北市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getHbroam() == null ? 0l : tro.getHbroam()));
				tro.setHbroam(null);
			} else if ("铜陵市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getTlroam() == null ? 0l : tro.getTlroam()));
				tro.setTlroam(null);
			} else if ("安庆市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getAqroam() == null ? 0l : tro.getAqroam()));
				tro.setAqroam(null);
			} else if ("黄山市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getHsroam() == null ? 0l : tro.getHsroam()));
				tro.setHsroam(null);
			} else if ("滁州市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getChuzroam() == null ? 0l : tro.getChuzroam()));
				tro.setChuzroam(null);
			} else if ("阜阳市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getFyroam() == null ? 0l : tro.getFyroam()));
				tro.setFyroam(null);
			} else if ("宿州市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getSzroam() == null ? 0l : tro.getLaroam()));
				tro.setSzroam(null);
			} else if ("六安市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getLaroam() == null ? 0l : tro.getLaroam()));
				tro.setLaroam(null);
			} else if ("亳州市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getHzroam() == null ? 0l : tro.getHzroam()));
				tro.setHzroam(null);
			} else if ("池州市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getChizroam() == null ? 0l : tro.getChizroam()));
				tro.setChizroam(null);
			} else if ("宣城市".equals(tro.getAreaname())) {
				tro.setSumroam(tro.getSumroam()
						- (tro.getXcroam() == null ? 0l : tro.getXcroam()));
				tro.setXcroam(null);
			}
			dislodgeIllegalList.add(tro);
		}
		return dislodgeIllegalList;
	}
	
	/**
	 * 导出excel
	 * **/
	public ActionResult expExcel(TouristRoamingOvernightIn touristRoamingOvernightIn){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getTouristRoamingOvernightInList(touristRoamingOvernightIn).getReturnList();
		//String titleStr = touristRoamingOvernightIn.getSearchstr();
		String titleStr = touristRoamingOvernightIn.getSearchTitlestr();
		String titleStrs="340100,340200,340300,340400,340600,340700,340800,340500,341000,341100,341200,341300,341500,341600,341700,341800";
		String[] titles=null;
		titles = titleStr.split(",");
		if(null != list && list.size()>0){
			String[] header = {"所属市","到皖过夜总数"};//,"合肥过夜 ","芜湖过夜","蚌埠过夜","淮南过夜 ",
//					"马鞍山过夜","淮北过夜","铜陵过夜","安庆过夜","黄山过夜","滁州过夜",
//					"阜阳过夜","宿州过夜","六安过夜","亳州过夜","池州过夜","宣城过夜"};
//			System.out.println("数组=============="+titles.length);
			int t=0;
			if(titleStr.length()>3){
			t=header.length+titles.length;
			}else{
				t=2;
			}
			System.out.println("数组大小为"+t);
			String[] header2 = new String[t];
			
			header2[0]=header[0];
			header2[1]=header[1];
			for(int m=0;m<titles.length;m++){
				if(titles[m].indexOf("340100")!=-1){
					header2[m+2]="合肥过夜";
				}else if(titles[m].indexOf("340200")!=-1){
					header2[m+2]="芜湖过夜";
				}else if(titles[m].indexOf("340300")!=-1){
					header2[m+2]="蚌埠过夜";
				}else if(titles[m].indexOf("340400")!=-1){
					header2[m+2]="淮南过夜";
				}else if(titles[m].indexOf("340500")!=-1){
					header2[m+2]="马鞍山过夜";
				}else if(titles[m].indexOf("340600")!=-1){
					header2[m+2]="淮北过夜";
				}else if(titles[m].indexOf("340700")!=-1){
					header2[m+2]="铜陵过夜";
				}else if(titles[m].indexOf("340800")!=-1){
					header2[m+2]="安庆过夜";
				}else if(titles[m].indexOf("341000")!=-1){
					header2[m+2]="黄山过夜";
				}else if(titles[m].indexOf("341100")!=-1){
					header2[m+2]="滁州过夜";
				}else if(titles[m].indexOf("341200")!=-1){
					header2[m+2]="阜阳过夜";
				}else if(titles[m].indexOf("341300")!=-1){
					header2[m+2]="宿州过夜";
				}else if(titles[m].indexOf("341500")!=-1){
					header2[m+2]="六安过夜";
				}else if(titles[m].indexOf("341600")!=-1){
					header2[m+2]="亳州过夜";
				}else if(titles[m].indexOf("341700")!=-1){
					header2[m+2]="池州过夜";
				}else if(titles[m].indexOf("341800")!=-1){
					header2[m+2]="宣城过夜";
				}
			}
			  
			String title = "本省漫游用户过夜统计";
			String[][] result = new String[list.size()][t];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(Object object:list){
				TouristRoamingOvernight r = (TouristRoamingOvernight)object;
				result[i][0] = r.getAreaname();
				result[i][1] = r.getSumroam()+"";
				
				for(int m=0;m<titles.length;m++){
					if(titles[m].indexOf("340100")!=-1){
						result[i][m+2]=r.getHfroam()+"";
					}else if(titles[m].indexOf("340200")!=-1){
						result[i][m+2]=r.getWhroam()+"";
					}else if(titles[m].indexOf("340300")!=-1){
						result[i][m+2]=r.getBbroam()+"";
					}else if(titles[m].indexOf("340400")!=-1){
						result[i][m+2]=r.getHnroam()+"";
					}else if(titles[m].indexOf("340500")!=-1){
						result[i][m+2]=r.getMasroam()+"";
					}else if(titles[m].indexOf("340600")!=-1){
						result[i][m+2]=r.getHbroam()+"";
					}else if(titles[m].indexOf("340700")!=-1){
						result[i][m+2]=r.getTlroam()+"";
					}else if(titles[m].indexOf("340800")!=-1){
						result[i][m+2]=r.getAqroam()+"";
					}else if(titles[m].indexOf("341000")!=-1){
						result[i][m+2]=r.getHsroam()+"";
					}else if(titles[m].indexOf("341100")!=-1){
						result[i][m+2]=r.getChuzroam()+"";
					}else if(titles[m].indexOf("341200")!=-1){
						result[i][m+2]=r.getFyroam()+"";
					}else if(titles[m].indexOf("341300")!=-1){
						result[i][m+2]=r.getSzroam()+"";
					}else if(titles[m].indexOf("341500")!=-1){
						result[i][m+2]=r.getLaroam()+"";
					}else if(titles[m].indexOf("341600")!=-1){
						result[i][m+2]=r.getHzroam()+"";
					}else if(titles[m].indexOf("341700")!=-1){
						result[i][m+2]=r.getChizroam()+"";
					}else if(titles[m].indexOf("341800")!=-1){
						result[i][m+2]=r.getXcroam()+"";
					}
				}
				
				i++;
			}
			
//			//导出数据出现null，去除null
			for(int s=0;s<result.length;s++){
				for(int k=0;k<result[s].length;k++){
					if(result[s][k].indexOf("null")!=-1){
						result[s][k]=" ";
					}
				}
			}
			 
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			try {
				reStr = exportExcelReport.exportReport(result, header2,title);
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
		}else{
			ar.setResultCode(2);
		}
		return ar;
	}
	
	public ActionResult expExcel2(TouristRomaingIn2 touristRoaming,String number){
		ActionResult ar=new ActionResult();
		List<TouristRomaingIn2> list2;
		String results="";
		List<Areas> area=null;
		SysOperator user=getSessionUser();
		String titleStr = touristRoaming.getSearchDestination();
		String countyid=user.getCountyCode();
		if(countyid!=null&&countyid!=""){
			area=touristRoamingOvernightInMgmt.queryByCounty(countyid);
		}else{
			area=touristRoamingOvernightInMgmt.queryByCityid(Constants.CITY_CODE);
		}
		if(countyid != null && countyid!="0" && countyid != ""){
			touristRoaming.setType("2");
		}else{
			touristRoaming.setType("1");
		}
		list2=touristRoamingOvernightInMgmt.queryTouristByCitysMonth(touristRoaming);
		if(null != list2 && list2.size()>0){
		results += "[";
		Map<String,String> resultMap = groupByCity(list2);
		Set<String> resultSet = resultMap.keySet();
		for (String str : resultSet) {
			results += ("{" + resultMap.get(str) + "},");
		}
		results = results.substring(0,results.length()-1)+"]";
		JSONArray  obj =new JSONArray(results);
		String[] titles=null;
		titles = titleStr.split(",");
		
			String[] header = {"所属市","漫游总数"};
			int t=0;
			if(titleStr.length()>3){
			t=header.length+titles.length;
			}else{
				t=2;
			}
			String[] header2 = new String[t];
			
			header2[0]=header[0];
			header2[1]=header[1];
			for(int i=0;i<area.size();i++){
				for(int m=0;m<titles.length;m++){
					if(titles[m].indexOf(area.get(i).getAreaid())!=-1){
						header2[m+1]="到达"+area.get(i).getAreas();
					}
				}
			}
			
			String title = "本省漫游用户过夜统计";
			String[][] result = new String[16][t];
			//String[][] result = new String[16][2];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
           for(i=0 ; i < obj.length() ;i++){
        	   System.out.println(obj.length());
				JSONObject myjObject = obj.getJSONObject(i);
				result[i][0] = myjObject.getString("cityname");
				result[i][1] = myjObject.getString("sumroam");
				for(int k=0;k<area.size();k++){
					for(int m=0;m<titles.length;m++){
						if(titles[m].indexOf(area.get(k).getAreaid())!=-1){
							if(!area.get(k).getAreaid().equals("341702")){
							result[i][m+1]=myjObject.getString(area.get(k).getAreaid());
							}
							
						}
					}
				}
			   }
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			try {
				if("".equals(number) || number==null || "underfind".equals(number) || number.isEmpty())
					//reStr = exportExcelReport.exportReport(result, header2,title);
					reStr = exportExcelReport.exportReport(result, header,title);
				else
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
		}else{
			ar.setResultCode(2);
		}
		return ar;
	}
	

	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser() {
		SysOperator user = super.getSessionUser();
		if (user == null) {
			user = new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}
