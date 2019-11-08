package com.funo.alarmsmsprovince.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.alarmsmsprovince.mgmt.IAlarmsmsMgmt;
import com.funo.alarmsmsprovince.model.Alarmsms;
import com.funo.system.model.SysOperator;

public class AlarmsmsAction extends CommonAction{
	private IAlarmsmsMgmt alarmsmsprovinceMgmt;

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllAlarmsms(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmsmsprovinceMgmt.queryAlarmsms(new Alarmsms());
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
	 * 根据条件获取列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAlarmsmsList(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmsmsprovinceMgmt.queryAlarmsms(alarmsms);
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
	 * 创建
	 */
	public ActionResult createAlarmsms(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		try {
			alarmsms=alarmsmsprovinceMgmt.createAlarmsms(alarmsms);
			ar.setReturnObject(alarmsms);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改
	 */
	public ActionResult updateAlarmsms(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		try {
			alarmsms=alarmsmsprovinceMgmt.modifyAlarmsms(alarmsms);
			ar.setReturnObject(alarmsms);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除
	 */
	public ActionResult deleteAlarmsms(Alarmsms alarmsms){
		ActionResult ar=new ActionResult();
		try {
			alarmsmsprovinceMgmt.deleteAlarmsms(alarmsms);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除
	 */
	public ActionResult batchDeleteAlarmsms(List<Alarmsms> alarmsmsList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<alarmsmsList.size();i++){
				this.deleteAlarmsms(alarmsmsList.get(i));
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
	public IAlarmsmsMgmt getAlarmsmsprovinceMgmt() {
		return alarmsmsprovinceMgmt;
	}
	public void setAlarmsmsprovinceMgmt(IAlarmsmsMgmt alarmsmsprovinceMgmt) {
		this.alarmsmsprovinceMgmt = alarmsmsprovinceMgmt;
	}
}