package com.funo.alarmLevel.action;

import java.util.Date;
import java.util.List;

import com.funo.alarmLevel.model.Region;
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.alarmLevel.mgmt.IRegionAlarmLevelMgmt;
import com.funo.alarmLevel.model.RegionAlarmLevel;
import com.funo.system.model.SysOperator;

public class RegionAlarmLevelAction extends CommonAction{
	private IRegionAlarmLevelMgmt regionAlarmLevelMgmt;

	public IRegionAlarmLevelMgmt getRegionAlarmLevelMgmt() {
		return regionAlarmLevelMgmt;
	}
	public void setRegionAlarmLevelMgmt(IRegionAlarmLevelMgmt regionAlarmLevelMgmt) {
		this.regionAlarmLevelMgmt = regionAlarmLevelMgmt;
	}
	

	/**
	 * 获取所有景区预警信息
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionAlarmLevel(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionAlarmLevelMgmt.queryRegionAlarmLevel(new RegionAlarmLevel());
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
	 * 根据条件获取景区预警配置列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionAlarmLevelList(RegionAlarmLevel regionAlarmLevel){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionAlarmLevelMgmt.queryRegionAlarmLevel(regionAlarmLevel);
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
	 * 判断景区是否已经存在，已存在，则不能添加
	 * @param regionId
	 * @return
	 */
	public boolean isRegionExist(Long regionId){
		RegionAlarmLevel regionAlarmLevel = new RegionAlarmLevel();
		regionAlarmLevel.setRegionId(regionId);
		List regionAlarmLevelList = regionAlarmLevelMgmt.queryRegionAlarmLevel(regionAlarmLevel);
		if(regionAlarmLevelList!=null&&regionAlarmLevelList.size()>0){
			return true;
		}
		return false;
	}

	/**
	 * 创建景区预警信息配置
	 */
	public ActionResult createRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel){
		ActionResult ar=new ActionResult();
		try {
			//判断景区是否已存在
			if(isRegionExist(regionAlarmLevel.getRegionId())){
				throw new Exception("该景区已存在,不能重复！");
			}
			regionAlarmLevel.setId(regionAlarmLevelMgmt.getKey());
			regionAlarmLevel.setEditTime(new Date());
			regionAlarmLevel.setCurrentLevel(0L);
			regionAlarmLevel=regionAlarmLevelMgmt.createRegionAlarmLevel(regionAlarmLevel);
			ar.setReturnObject(regionAlarmLevel);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改景区预警配置信息
	 */
	public ActionResult updateRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel){
		ActionResult ar=new ActionResult();
		try {
			regionAlarmLevel.setEditTime(new Date());
			regionAlarmLevel=regionAlarmLevelMgmt.modifyRegionAlarmLevel(regionAlarmLevel);
			ar.setReturnObject(regionAlarmLevel);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除景区预警配置信息
	 */
	public ActionResult deleteRegionAlarmLevel(RegionAlarmLevel regionAlarmLevel){
		ActionResult ar=new ActionResult();
		try {
			regionAlarmLevelMgmt.deleteRegionAlarmLevel(regionAlarmLevel);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除景区预警配置信息
	 */
	public ActionResult batchDeleteRegionAlarmLevel(List<RegionAlarmLevel> regionAlarmLevelList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<regionAlarmLevelList.size();i++){
				this.deleteRegionAlarmLevel(regionAlarmLevelList.get(i));
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
	 * 获取景区列表
	 * @return
	 */
	public ActionResult queryRegions(){
		ActionResult ar=new ActionResult();
		try {
			List regions= regionAlarmLevelMgmt.queryByRegion();
			ar.setReturnList(regions);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
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