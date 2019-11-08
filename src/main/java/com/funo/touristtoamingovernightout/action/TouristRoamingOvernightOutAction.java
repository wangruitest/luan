package com.funo.touristtoamingovernightout.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.funo.common.CommonAction;
import com.funo.region.mgmt.IRegionCfgMgmt;
import com.funo.region.model.Areas;
import com.funo.common.ActionResult;
import com.funo.touristtoamingovernightout.mgmt.ITouristRoamingOvernightOutMgmt;
import com.funo.touristtoamingovernightout.model.TouristRoamingOvernightOut;
import com.funo.utils.Constants;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;
import com.funo.touristtoamingout.model.TouristRoamingOut2;

public class TouristRoamingOvernightOutAction extends CommonAction{
	private ITouristRoamingOvernightOutMgmt touristRoamingOvernightOutMgmt;

	public ITouristRoamingOvernightOutMgmt getTouristRoamingOvernightOutMgmt() {
		return touristRoamingOvernightOutMgmt;
	}
	public void setTouristRoamingOvernightOutMgmt(ITouristRoamingOvernightOutMgmt touristRoamingOvernightOutMgmt) {
		this.touristRoamingOvernightOutMgmt = touristRoamingOvernightOutMgmt;
	}
	
	private IRegionCfgMgmt regionCfgMgmt;

	public IRegionCfgMgmt getRegionCfgMgmt() {
		return regionCfgMgmt;
	}
	public void setRegionCfgMgmt(IRegionCfgMgmt regionCfgMgmt) {
		this.regionCfgMgmt = regionCfgMgmt;
	}
	

	/**
	 * 获取所有外省手机漫游用户到闽过夜情况表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllTouristRoamingOvernightOut(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = touristRoamingOvernightOutMgmt.queryTouristRoamingOvernightProvincesOut(new TouristRoamingOvernightOut());
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
	public ActionResult getTouristRoamingOvernightOutList(TouristRoamingOvernightOut touristRoamingOvernightOut){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = touristRoamingOvernightOutMgmt.queryTouristRoamingOvernightProvincesOut(touristRoamingOvernightOut);
			if(result.size()<1){
				ar.setReturnList(result);
				ar.setResultCode(2);
			}else{
				if(null != result && result.size()>0){
					result.add(totalRoaming(result));
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
	public String getTouristRoamingOvernightOutList2(TouristRoamingOut2 touristRoamingOut){
		String result="{";
		SysOperator user = getSessionUser();
		String type = user.getCountyCode();
		List resultList = null;
		try {
			if(type != null && type!="0" && type != ""){
				touristRoamingOut.setType("2");
			}else{
				touristRoamingOut.setType("1");
			}
			resultList = touristRoamingOvernightOutMgmt.queryTouristRoamingOvernightProvincesOut2(touristRoamingOut);
			if(resultList.size()<1){
				result += "resultCode:'2'";
			}else{
				if(null != resultList && resultList.size()>0){
					result += "resultCode:'0',returnList:[";
					Map<String,String> resultMap = groupByProvince(resultList);
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
	
	public Map<String,String> groupByProvince(List<TouristRoamingOut2> list){
		Map<String,String> map = new HashMap<String,String>();
		for (int i = 0; i < list.size(); i++) {
				if(map.get(list.get(i).getProvinceid())==null){
					String item = "provinces:'"+list.get(i).getProvinces()+
							"',"+list.get(i).getDestination()+":'"+list.get(i).getSumroam()+"'";
					map.put(list.get(i).getProvinceid(), item);
				}else{
					String item = map.get(list.get(i).getProvinceid())+","+list.get(i).getDestination()+":'"+list.get(i).getSumroam()+"'";
					map.put(list.get(i).getProvinceid(), item);
				}
		}
		return map;
	}
	
	@SuppressWarnings({ "rawtypes" })
	public TouristRoamingOvernightOut totalRoaming(List list){
		Long totalsum= 0l;
		Long totalhfroam= 0l;//合肥市合计
		Long totalwhroam= 0l;//芜湖市合计
		Long totalbbroam= 0l;//蚌埠市合计
		Long totalhnroam= 0l;//淮南市合计
		Long totalmasroam= 0l;//马鞍山市合计
		Long totalhbroam= 0l;//淮北市合计
		Long totaltlroam= 0l;//铜陵市合计
		Long totalaqroam= 0l;//安庆市合计
		Long totalhsroam= 0l;//黄山市合计
		Long totalchuzroam= 0l;//滁州市合计
		Long totalfyroam= 0l;//阜阳市合计
		Long totalszroam= 0l;//宿州市合计
		Long totallaroam= 0l;//六安市合计
		Long totalhzroam= 0l;//亳州市合计
		Long totalchizroam= 0l;//池州市合计
		Long totalxcroam= 0l;//宣城市合计
		TouristRoamingOvernightOut tr = new TouristRoamingOvernightOut();
		for(int j = 0;j<list.size();j++){
			TouristRoamingOvernightOut trr = (TouristRoamingOvernightOut)list.get(j);
//			totalsum+=trr.getSumroam()==null?0l:trr.getSumroam();
//			totalfz+=trr.getFzroam()==null?0l:trr.getFzroam();
//			totalxm+=trr.getXmroam()==null?0l:trr.getXmroam();
//			totalnd+=trr.getNdroam()==null?0l:trr.getNdroam();
//			totalpt+=trr.getPtroam()==null?0l:trr.getPtroam();
//			totalqz+=trr.getQzroam()==null?0l:trr.getQzroam();
//			totalzz+=trr.getZzroam()==null?0l:trr.getZzroam();
//			totally+=trr.getLyroam()==null?0l:trr.getLyroam();
//			totalsm+=trr.getSmroam()==null?0l:trr.getSmroam();
//			totalnp+=trr.getNproam()==null?0l:trr.getNproam();
			
			totalsum+=trr.getSumroam()==null?0l:trr.getSumroam();			
			totalhfroam+=trr.getHfroam()==null?0l:trr.getHfroam();			
			totalwhroam+=trr.getWhroam()==null?0l:trr.getWhroam();					
			totalbbroam+=trr.getBbroam()==null?0l:trr.getBbroam();			
			totalhnroam+=trr.getHnroam()==null?0l:trr.getHnroam();			
			totalmasroam+=trr.getMasroam()==null?0l:trr.getMasroam();			
			totalhbroam+=trr.getHbroam()==null?0l:trr.getHbroam();			
			totaltlroam+=trr.getTlroam()==null?0l:trr.getTlroam();			
			totalaqroam+=trr.getAqroam()==null?0l:trr.getAqroam();			
			totalhsroam+=trr.getHsroam()==null?0l:trr.getHsroam();			
			totalchuzroam+=trr.getChuzroam()==null?0l:trr.getChuzroam();			
			totalfyroam+=trr.getFyroam()==null?0l:trr.getFyroam();			
			totalszroam+=trr.getSzroam()==null?0l:trr.getSzroam();			
			totallaroam+=trr.getLaroam()==null?0l:trr.getLaroam();			
			totalhzroam+=trr.getHzroam()==null?0l:trr.getHzroam();			
			totalchizroam+=trr.getChizroam()==null?0l:trr.getChizroam();			
			totalxcroam+=trr.getXcroam()==null?0l:trr.getXcroam();	
			
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
	 * 导出excel
	 * **/
	public ActionResult expExcel(TouristRoamingOvernightOut touristRoamingOvernightOut){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getTouristRoamingOvernightOutList(touristRoamingOvernightOut).getReturnList();
	    String titleStr = touristRoamingOvernightOut.getSearchTitlestr();
		//String titleStrs="340100,340200,340300,340400,340600,340700,340800,340500,341000,341100,341200,341300,341500,341600,341700,341800";
		String[] titles=null;
		titles = titleStr.split(",");
		if(null != list && list.size()>0){
			String[] header = {"所属市","到皖过夜总数"};//,"合肥过夜 ","芜湖过夜","蚌埠过夜","淮南过夜 ",
//					"马鞍山过夜","淮北过夜","铜陵过夜","安庆过夜","黄山过夜","滁州过夜",
//					"阜阳过夜","宿州过夜","六安过夜","亳州过夜","池州过夜","宣城过夜"};
			
			int t=0;
			if(titleStr.length()>3){
			t=header.length+titles.length;
			}else{
				t=2;
			}
			//int t=header.length;
			String[] header2 = new String[t];
			
			header2[0]=header[0];
			header2[1]=header[1];
			//header2[2]="六安";
			
			for(int m=0;m<titles.length;m++){
				if(titles[m].indexOf("340100")!=-1){
					header2[m+2]="合肥过夜";
				}else if(titles[m].indexOf("340200")!=-1){
					header2[m+2]="芜湖过夜";
				}else if(titles[m].indexOf("340300")!=-1){
					header2[m+2]="蚌埠过夜";
				}else if(titles[m].indexOf("340400")!=-1){
					header2[m+2]="淮南 过夜";
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
//			
			String title = "外省漫游用户过夜统计";
			String[][] result = new String[list.size()][t];
			//String[][] result = new String[list.size()][2];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(Object object:list){
				TouristRoamingOvernightOut r = (TouristRoamingOvernightOut)object;
				result[i][0] = r.getAreaname();
				result[i][1] = r.getSumroam()+"";
				//result[i][2]=r.getLaroam()+"";
				
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
	
	
	@SuppressWarnings("rawtypes")
	public ActionResult expExcel2(TouristRoamingOut2 touristRoamingOut,String number){
		ActionResult ar=new ActionResult();
		List list2=null;
		String results="";
		List<Areas> area=null;
		SysOperator user=getSessionUser();
		String titleStr = touristRoamingOut.getSearchDestination();
		String[] titles = titleStr.split(",");
		String countyid=user.getCountyCode();
		if(countyid!=null&&countyid!=""){
			area=touristRoamingOvernightOutMgmt.queryByCounty(countyid);
		}else{
			area=touristRoamingOvernightOutMgmt.queryByCityid(Constants.CITY_CODE);
		}
		if(countyid != null && countyid!="0" && countyid != ""){
			touristRoamingOut.setType("2");
		}else{
			touristRoamingOut.setType("1");
		}
		list2=touristRoamingOvernightOutMgmt.queryTouristRoamingOvernightProvincesOut2(touristRoamingOut);
		if(null != list2 && list2.size()>0){
		results += "[";
		Map<String,String> resultMap = groupByProvince(list2);
		Set<String> resultSet = resultMap.keySet();
		for (String str : resultSet) {
			results += ("{" + resultMap.get(str) + "},");
		}
		results = results.substring(0,results.length()-1)+"]";
		JSONArray  obj =new JSONArray(results);
		
			String[] header = {"所属省","漫游总数"};
			
			int t=header.length+titles.length;
			
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
			
			String title = "外省漫游用户过夜统计";
			String[][] result = new String[obj.length()][t];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(i=0 ; i < obj.length() ;i++){
				JSONObject myjObject = obj.getJSONObject(i);
				result[i][0] = myjObject.getString("provinces");
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
				reStr = exportExcelReport.exportReport(result, header2,title);
				else
				reStr = exportExcelReport.exportReport(result, header2,title,number);
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
