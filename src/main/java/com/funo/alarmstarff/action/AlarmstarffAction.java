package com.funo.alarmstarff.action;

import java.util.Date;
import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.alarmstarff.mgmt.IAlarmstarffMgmt;
import com.funo.alarmstarff.model.Alarmstarff;
import com.funo.system.model.SysOperator;

public class AlarmstarffAction extends CommonAction{
	private IAlarmstarffMgmt alarmstarffMgmt;

	public IAlarmstarffMgmt getAlarmstarffMgmt() {
		return alarmstarffMgmt;
	}
	public void setAlarmstarffMgmt(IAlarmstarffMgmt alarmstarffMgmt) {
		this.alarmstarffMgmt = alarmstarffMgmt;
	}
	

	/**
	 * 获取所有故障监视人员告警表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllAlarmstarff(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmstarffMgmt.queryAlarmstarff(new Alarmstarff());
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
	 * 根据条件获取故障监视人员告警表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAlarmstarffList(Alarmstarff alarmstarff){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = alarmstarffMgmt.queryAlarmstarff(alarmstarff);
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
	 * 创建故障监视人员告警表
	 */
	public ActionResult createAlarmstarff(Alarmstarff alarmstarff){
		ActionResult ar=new ActionResult();
		try {
			//alarmstarff.setUnid(alarmstarffMgmt.getKey());
			alarmstarff.setUpdatetime(new Date());
			alarmstarff=alarmstarffMgmt.createAlarmstarff(alarmstarff);
			ar.setReturnObject(alarmstarff);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改故障监视人员告警表
	 */
	public ActionResult updateAlarmstarff(Alarmstarff alarmstarff){
		ActionResult ar=new ActionResult();
		try {
			alarmstarff.setUpdatetime(new Date());
			alarmstarff=alarmstarffMgmt.modifyAlarmstarff(alarmstarff);
			ar.setReturnObject(alarmstarff);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除故障监视人员告警表
	 */
	public ActionResult deleteAlarmstarff(Alarmstarff alarmstarff){
		ActionResult ar=new ActionResult();
		try {
			alarmstarffMgmt.deleteAlarmstarff(alarmstarff);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除故障监视人员告警表
	 */
	public ActionResult batchDeleteAlarmstarff(List<Alarmstarff> alarmstarffList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<alarmstarffList.size();i++){
				this.deleteAlarmstarff(alarmstarffList.get(i));
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
	 * 添加时，根据输入号码查看是否号码已存在
	 */
	@SuppressWarnings("rawtypes")
	public boolean isPhomeNumExistence(Alarmstarff alarmstarff){
		boolean isExistence = false;
		List result=null;
		try {
			result=alarmstarffMgmt.queryPhoneNumExistence(alarmstarff);
			if(result.isEmpty()){
				isExistence = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isExistence;
	}
	
	/**
	 * 修改时，根据输入号码查看是否号码已存在
	 */
	@SuppressWarnings("rawtypes")
	public boolean isPhomeNumExistenceForEdit(Alarmstarff alarmstarff){
		boolean isExistence = false;
		List result=null;
		try {
			result=alarmstarffMgmt.queryPhoneNum(alarmstarff);
			if(result.isEmpty()){
				isExistence = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isExistence;
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