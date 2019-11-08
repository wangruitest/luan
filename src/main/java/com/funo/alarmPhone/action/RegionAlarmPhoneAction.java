package com.funo.alarmPhone.action;

import java.util.*;

import com.funo.alarmPhone.model.Region;
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.alarmPhone.mgmt.IRegionAlarmPhoneMgmt;
import com.funo.alarmPhone.model.RegionAlarmPhone;
import com.funo.system.model.SysOperator;

public class RegionAlarmPhoneAction extends CommonAction{
	private IRegionAlarmPhoneMgmt regionAlarmPhoneMgmt;

	public IRegionAlarmPhoneMgmt getRegionAlarmPhoneMgmt() {
		return regionAlarmPhoneMgmt;
	}
	public void setRegionAlarmPhoneMgmt(IRegionAlarmPhoneMgmt regionAlarmPhoneMgmt) {
		this.regionAlarmPhoneMgmt = regionAlarmPhoneMgmt;
	}
	

	/**
	 * 获取所有???????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRegionAlarmPhone(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = regionAlarmPhoneMgmt.queryRegionAlarmPhone(new RegionAlarmPhone());
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
	 * 根据条件获取???????列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getRegionAlarmPhoneList(RegionAlarmPhone regionAlarmPhone){
		ActionResult ar=new ActionResult();
		List result=new ArrayList();
		try {
			List<RegionAlarmPhone> alarmPhoneList = regionAlarmPhoneMgmt.queryRegionAlarmPhone(regionAlarmPhone);
			for(RegionAlarmPhone alarmPhone :alarmPhoneList){
				RegionAlarmPhone rap =new RegionAlarmPhone();
				rap.setPhone(alarmPhone.getPhone());
				rap.setName(alarmPhone.getName());
				List<Region> regions = regionAlarmPhoneMgmt.queryRegions(rap);
				alarmPhone.setRegions(regions);
				result.add(alarmPhone);
			}
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
	 * 创建???????
	 */
	public ActionResult createRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone){
		ActionResult ar=new ActionResult();
		try {
			if(regionAlarmPhoneMgmt.isUserExist(regionAlarmPhone)){
				throw new Exception("该用户已经存在!");
			}
			for(Region region:regionAlarmPhone.getRegions()){
				RegionAlarmPhone rap = new RegionAlarmPhone();
				rap.setEditTime(new Date());
				rap.setName(regionAlarmPhone.getName());
				rap.setPhone(regionAlarmPhone.getPhone());
				rap.setRegionId(Long.valueOf(region.getUnid()));
				regionAlarmPhoneMgmt.createRegionAlarmPhone(rap);
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
	 * 修改???????
	 */
	public ActionResult updateRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone){
		ActionResult ar=new ActionResult();
		Map oldRegionMap = new HashMap<Long,String>();
		Map newRegionMap = new HashMap<Long,String>();
		try {
			RegionAlarmPhone oldRap =regionAlarmPhoneMgmt.getRegionAlarmPhoneById(regionAlarmPhone.getId());
			ActionResult aresult = getRegionAlarmPhoneList(oldRap);

			
				if(regionAlarmPhoneMgmt.isUserExist(regionAlarmPhone)){
					throw new Exception("该用户已经存在!");
				}else{
				regionAlarmPhone.setEditTime(new Date());
				regionAlarmPhone.setOldName(oldRap.getName());
				regionAlarmPhone.setOldPhone(oldRap.getPhone());
				regionAlarmPhoneMgmt.modifyRegionAlarmPhone(regionAlarmPhone);
				}
			

			List<Region> newRegionsList = regionAlarmPhone.getRegions();
			for(Region newRegion :newRegionsList){
				newRegionMap.put(newRegion.getUnid(),"");
			}
			if(aresult.getResultCode()==0){
				List arList = aresult.getReturnList();
				RegionAlarmPhone rap = (RegionAlarmPhone)arList.get(0);
				List<Region> oldRegionsList = rap.getRegions();
				for(Region oldRegion :oldRegionsList){
					oldRegionMap.put(oldRegion.getUnid(),"");
				}
				//添加预警景区
				for(Region newRegion:newRegionsList){
					if(!oldRegionMap.containsKey(newRegion.getUnid())){
						RegionAlarmPhone raphone = new RegionAlarmPhone();
						raphone.setId(regionAlarmPhoneMgmt.getKey());
						raphone.setEditTime(new Date());
						raphone.setName(regionAlarmPhone.getName());
						raphone.setPhone(regionAlarmPhone.getPhone());
						raphone.setRegionId(Long.valueOf(newRegion.getUnid()));
						regionAlarmPhoneMgmt.createRegionAlarmPhone(raphone);
					}
				}
				//删除预警景区
				for(Region oldRegion:oldRegionsList){
					if(!newRegionMap.containsKey(oldRegion.getUnid())){
						RegionAlarmPhone raphone = new RegionAlarmPhone();
						raphone.setName(regionAlarmPhone.getName());
						raphone.setPhone(regionAlarmPhone.getPhone());
						raphone.setRegionId(Long.valueOf(oldRegion.getUnid()));
						regionAlarmPhoneMgmt.deleteRegionAlarmPhone(raphone);
					}
				}
			}
			//ar.setReturnObject(regionAlarmPhone);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除???????
	 */
	public ActionResult deleteRegionAlarmPhone(RegionAlarmPhone regionAlarmPhone){
		ActionResult ar=new ActionResult();
		try {
			RegionAlarmPhone rap =regionAlarmPhoneMgmt.getRegionAlarmPhoneById(regionAlarmPhone.getId());
			RegionAlarmPhone newRap = new RegionAlarmPhone();
			newRap.setPhone(rap.getPhone());
			newRap.setName(rap.getName());
			regionAlarmPhoneMgmt.deleteRegionAlarmPhone(newRap);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除???????
	 */
	public ActionResult batchDeleteRegionAlarmPhone(List<RegionAlarmPhone> regionAlarmPhoneList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<regionAlarmPhoneList.size();i++){
				this.deleteRegionAlarmPhone(regionAlarmPhoneList.get(i));
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