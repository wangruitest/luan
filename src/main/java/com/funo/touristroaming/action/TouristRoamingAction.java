package com.funo.touristroaming.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.touristroaming.mgmt.ITouristRoamingMgmt;
import com.funo.touristroaming.model.ShitaiRoaming;
import com.funo.touristroaming.model.TouristRoaming;
import com.funo.touristroamingin.model.TouristRoamingIn;
import com.funo.utils.Constants;
import com.funo.report.ExportExcelReport;
import com.funo.system.model.SysOperator;

public class TouristRoamingAction extends CommonAction{
	private ITouristRoamingMgmt touristRoamingMgmt;

	public ITouristRoamingMgmt getTouristRoamingMgmt() {
		return touristRoamingMgmt;
	}
	public void setTouristRoamingMgmt(ITouristRoamingMgmt touristRoamingMgmt) {
		this.touristRoamingMgmt = touristRoamingMgmt;
	}
	

	/**
	 * 获取所有外省手机漫游用户到闽情况表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllTouristRoaming(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = touristRoamingMgmt.queryTouristRoaming(new TouristRoaming());
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
	 * 根据条件获取外省手机漫游用户到闽情况表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getTouristRoamingList(TouristRoaming touristRoaming){
		TouristRoaming touristRoamingAllCitys = new TouristRoaming();//全省漫游
		ActionResult ar=new ActionResult();
		List result=null;
		List<TouristRoaming> resultAllCity=null;//全省漫游
		TouristRoaming roaming = null;
		SysOperator user=getSessionUser();
		try {
			touristRoamingAllCitys.setStatMonth(touristRoaming.getStatMonth());
			if(user.getCountyCode()==null||"0".equals(user.getCountyCode())){
			result = touristRoamingMgmt.queryTouristRoaming(touristRoaming);
			}else{
			touristRoaming.setCountyCode(user.getCountyCode());
			result = touristRoamingMgmt.queryByAllCounty(touristRoaming);
			}
			resultAllCity = touristRoamingMgmt.queryAllCityTouristRoaming(touristRoamingAllCitys);
			if(result.size()<1){
				ar.setReturnList(result);
				ar.setResultCode(2);
			}else{
				roaming = (TouristRoaming)result.get(0);
				roaming.setTotalCount(resultAllCity.get(0).getAreaCount()==null ? 0:resultAllCity.get(0).getAreaCount());
				roaming.setProvinceName("安徽");
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
	
	
	
	
	/**
	 * 根据条件获取外省手机漫游用户到石台情况表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getShitaiRoamingList(ShitaiRoaming shitaiRoaming){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = touristRoamingMgmt.queryByShitai(shitaiRoaming);
			if(result.size()<1){
				ar.setReturnList(result);
				ar.setResultCode(2);
			}else{
				if(null != result && result.size()>0){
					result = dislodgeIllegalData(result);
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
	public List dislodgeIllegalData(List list){
		List dislodgeIllegalList = new ArrayList();
		DecimalFormat    df   = new DecimalFormat("######0.00");   
		for(int i = 0;i<list.size();i++){
			ShitaiRoaming tro = (ShitaiRoaming)list.get(i);
			double touristsRate=Double.parseDouble(tro.getTouristsCount())/Double.parseDouble(tro.getPassengerCount())*100;
			String touristsRate2=df.format(touristsRate)+"%";
			tro.setTouristsRate(touristsRate2);
			double overnightRate=Double.parseDouble(tro.getOvernightCount())/Double.parseDouble(tro.getPassengerCount())*100;
			String overnightRate2=df.format(overnightRate)+"%";
			tro.setOvernightRate(overnightRate2);
			dislodgeIllegalList.add(tro);
		}
		return dislodgeIllegalList;
	}
	
	/**
	 * 创建外省手机漫游用户到闽情况表
	 */
	public ActionResult createTouristRoaming(TouristRoaming touristRoaming){
		ActionResult ar=new ActionResult();
		try {
			touristRoaming=touristRoamingMgmt.createTouristRoaming(touristRoaming);
			ar.setReturnObject(touristRoaming);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改外省手机漫游用户到闽情况表
	 */
	public ActionResult updateTouristRoaming(TouristRoaming touristRoaming){
		ActionResult ar=new ActionResult();
		try {
			touristRoaming=touristRoamingMgmt.modifyTouristRoaming(touristRoaming);
			ar.setReturnObject(touristRoaming);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除外省手机漫游用户到闽情况表
	 */
	public ActionResult deleteTouristRoaming(TouristRoaming touristRoaming){
		ActionResult ar=new ActionResult();
		try {
			touristRoamingMgmt.deleteTouristRoaming(touristRoaming);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除外省手机漫游用户到闽情况表
	 */
	public ActionResult batchDeleteTouristRoaming(List<TouristRoaming> touristRoamingList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<touristRoamingList.size();i++){
				this.deleteTouristRoaming(touristRoamingList.get(i));
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
	 * 导出excel
	 * **/
	public ActionResult expExcel(TouristRoaming touristRoaming,String number){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getTouristRoamingList(touristRoaming).getReturnList();
		SysOperator user=getSessionUser();
		if(null != list && list.size()>0){
			String[] header = {"省份","漫游用户数（人次）","各市","漫游用户数（人次）","区县","漫游用户数（人次）"};
			String title = "境外入皖漫游用户统计";
			String[][] result = new String[list.size()][header.length];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			result[0][0] = "安徽";
			TouristRoaming r = (TouristRoaming)list.get(0);
			result[0][1] = r.getTotalCount()+"";
			if(user.getCountyCode()==null||"0".equals(user.getCountyCode())){
			for(Object object:list){
				TouristRoaming t = (TouristRoaming)object;
				
				result[i][2] = t.getAreaName();
				result[i][3] = t.getAreaCount()+"";
				i++;
			}
			}else{
				for(Object object:list){
					TouristRoaming t = (TouristRoaming)object;
					
					result[i][4] = t.getCountyName();
					result[i][5] = t.getCountyCount()+"";
					i++;
				}
			}
			ExportExcelReport exportExcelReport = new ExportExcelReport();
			try {
				if("".equals(number) || number==null || "underfind".equals(number) || number.isEmpty())
				reStr = exportExcelReport.exportReport(result, header,title);
				else
				reStr = exportExcelReport.exportReport(result, header,title,number);	
				reStr1[0] = reStr[0];
				reStr1[1] = reStr[1];
				reStr1[2] = "EXPTOURISTROAMING_"+reStr[1];
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
	
	
	public ActionResult expExcelShiTai(ShitaiRoaming shitaiRoaming,String number){
		ActionResult ar=new ActionResult();
		List<Object> list;
		list = getShitaiRoamingList(shitaiRoaming).getReturnList();
		SysOperator user=getSessionUser();
		if(null != list && list.size()>0){
			String[] header = {"所属省/市","漫游旅客（人次）","漫游游客（人次）","漫游过夜（人次）","游客转化率","过夜转化率"};
			String title = "石台漫游数据统计";
			String[][] result = new String[list.size()][header.length];
			String[] reStr = null;
			String[] reStr1 = new String[3];
			int i = 0;
			for(Object object:list){
				ShitaiRoaming t = (ShitaiRoaming)object;
				result[i][0] = t.getProvinceName();
				result[i][1] = t.getPassengerCount();
				result[i][2] = t.getTouristsCount();
				result[i][3] = t.getOvernightCount();
				result[i][4] = t.getTouristsRate();
				result[i][5] = t.getOvernightRate();
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
				reStr1[2] = "EXPTOURISTROAMING_"+reStr[1];
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