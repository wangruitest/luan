package com.funo.region.action;

import java.util.Date;
import java.util.List;

import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.region.mgmt.IRegionCfgMgmt;
import com.funo.region.model.RegionCfg;
import com.funo.system.model.SysOperator;
import com.funo.utils.Constants;

public class RegionCfgAction extends CommonAction{
	private IRegionCfgMgmt regionCfgMgmt;

	public IRegionCfgMgmt getRegionCfgMgmt() {
		return regionCfgMgmt;
	}
	public void setRegionCfgMgmt(IRegionCfgMgmt regionCfgMgmt) {
		this.regionCfgMgmt = regionCfgMgmt;
	}
	

	/**
	 * 获取所有?????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionCfgMgmt.queryRegionCfg(new RegionCfg());
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
	 * 从省平台获取所有景区信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionCfgFromProvince(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
//			setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_CSMS);
//			setUserExParams(Constants.TEMP_ORG_CODE, "590");
			result = regionCfgMgmt.queryRegionCfg(new RegionCfg());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAreasList(String cityid){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionCfgMgmt.queryByCityid(cityid);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getArea(String countyid){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionCfgMgmt.queryByCounty(countyid);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAreasListByName(String cityName){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionCfgMgmt.queryBycityName(cityName);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAreasListByOperator(String cityid){
		ActionResult ar=new ActionResult();
		SysOperator user = getSessionUser();
		cityid = cityid==null?"3410100":cityid;
		RegionCfg qRegionCfg=new RegionCfg();
		qRegionCfg.setCountyCode(user.getCountyCode());
		qRegionCfg.setCityCode(cityid);
		List result=null;
		try {
			result = regionCfgMgmt.queryByOperator(qRegionCfg);
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
	 * 根据条件获取景区列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionCfgListByCountyid(String  countyid){
		ActionResult ar=new ActionResult();
		RegionCfg qRegionCfg=new RegionCfg();
		qRegionCfg.setCountyCode(countyid);
		List result=null;
		try {
			result = regionCfgMgmt.queryByCountyid(qRegionCfg);
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
	 * 根据条件获取?????列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionCfgList(RegionCfg regionCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionCfgMgmt.queryRegionCfg(regionCfg);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	private boolean setUserExParams(String key,String value){
		boolean result=true;
		try{
			SysOperator user=this.getSessionUser();
			user.getOtherParams().put(key, value);
		}catch(Exception e){
			result=false;
			e.printStackTrace();
		}
		return result;
	}
	
	private void connectToTisDb(){
		SysOperator user=this.getSessionUser();
		setUserExParams(Constants.TEMP_DB_TYPE, Constants.DB_TYPE_TIS);
		String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
		setUserExParams(Constants.TEMP_ORG_CODE, curCityCode);
	}
		
	public ActionResult getRegionCfgListWithConnect(RegionCfg regionCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			connectToTisDb();
			result = regionCfgMgmt.queryRegionCfg(regionCfg);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	public ActionResult getRegionCfgBySendareaId(String sendareaId){
		ActionResult ar=new ActionResult();
		RegionCfg result=null;
		try {
			connectToTisDb();
			result = regionCfgMgmt.getBySendareaId(sendareaId);
			ar.setReturnObject(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	
	/**
	 * 创建?????
	 */
	public ActionResult createRegionCfg(RegionCfg regionCfg){
		ActionResult ar=new ActionResult();
		try {
			
			if (!validateDulAddRegionId(regionCfg.getId())){
				ar.setResultCode(-2);
				return ar;
			}
			regionCfg.setMinStaytime(10L);
			regionCfg=regionCfgMgmt.createRegionCfg(regionCfg);
			ar.setReturnObject(regionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改?????
	 */
	public ActionResult updateRegionCfg(RegionCfg regionCfg){
		ActionResult ar=new ActionResult();
		try {
			
			if (!validateDulUpdateRegionId(regionCfg)){
				ar.setResultCode(-2);
				return ar;
			}
			
			regionCfg.setUpdatetime(new Date());
			regionCfg.setUpdateuser(super.getSessionUser().getName());
			regionCfg=regionCfgMgmt.modifyRegionCfg(regionCfg);
			ar.setReturnObject(regionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除?????
	 */
	public ActionResult deleteRegionCfg(RegionCfg regionCfg){
		ActionResult ar=new ActionResult();
		try {
			regionCfgMgmt.deleteRegionCfg(regionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除?????
	 */
	public ActionResult batchDeleteRegionCfg(List<RegionCfg> regionCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<regionCfgList.size();i++){
				this.deleteRegionCfg(regionCfgList.get(i));
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
	 * 添加时验证景区id是否重复
	 */
	public boolean validateDulAddRegionId(Long id){
		RegionCfg regionCfg = new RegionCfg();
		regionCfg.setId(id);
		List<RegionCfg> regionCfgList = regionCfgMgmt.queryRegionCfg(regionCfg);
		if (regionCfgList!=null&&regionCfgList.size()>0){
			return false;
		} 
		return true;
	}
	
	/**
	 * 修改时验证景区id是否重复
	 */
	public boolean validateDulUpdateRegionId(RegionCfg regionCfg){
		RegionCfg regionCfgUpdate = new RegionCfg();
		regionCfgUpdate.setId(regionCfg.getId());
		regionCfgUpdate.setUnid(regionCfg.getUnid());
		List<RegionCfg> regionCfgList = regionCfgMgmt.queryRegionIdUpdate(regionCfgUpdate);
		if (regionCfgList!=null&&regionCfgList.size()>0){
			return false;
		} 
		return true;
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