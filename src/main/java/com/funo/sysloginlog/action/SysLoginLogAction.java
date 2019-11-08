package com.funo.sysloginlog.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.sysloginlog.mgmt.ISysLoginLogMgmt;
import com.funo.sysloginlog.model.SysLoginLog;
import com.funo.system.model.SysOperator;

public class SysLoginLogAction extends CommonAction{
	private ISysLoginLogMgmt sysLoginLogMgmt;

	public ISysLoginLogMgmt getSysLoginLogMgmt() {
		return sysLoginLogMgmt;
	}
	public void setSysLoginLogMgmt(ISysLoginLogMgmt sysLoginLogMgmt) {
		this.sysLoginLogMgmt = sysLoginLogMgmt;
	}
	

	/**
	 * 获取所有登录日志表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysLoginLog(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysLoginLogMgmt.querySysLoginLog(new SysLoginLog());
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
	 * 根据条件获取登录日志表列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysLoginLogList(SysLoginLog sysLoginLog){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysLoginLogMgmt.querySysLoginLog(sysLoginLog);
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
	 * 创建登录日志表
	 */
	public ActionResult createSysLoginLog(SysLoginLog sysLoginLog){
		ActionResult ar=new ActionResult();
		try {
			sysLoginLog.setUnid(sysLoginLogMgmt.getKey());
			sysLoginLog=sysLoginLogMgmt.createSysLoginLog(sysLoginLog);
			ar.setReturnObject(sysLoginLog);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改登录日志表
	 */
	public ActionResult updateSysLoginLog(SysLoginLog sysLoginLog){
		ActionResult ar=new ActionResult();
		try {
			sysLoginLog=sysLoginLogMgmt.modifySysLoginLog(sysLoginLog);
			ar.setReturnObject(sysLoginLog);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除登录日志表
	 */
	public ActionResult deleteSysLoginLog(SysLoginLog sysLoginLog){
		ActionResult ar=new ActionResult();
		try {
			sysLoginLogMgmt.deleteSysLoginLog(sysLoginLog);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除登录日志表
	 */
	public ActionResult batchDeleteSysLoginLog(List<SysLoginLog> sysLoginLogList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysLoginLogList.size();i++){
				this.deleteSysLoginLog(sysLoginLogList.get(i));
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