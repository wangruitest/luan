package com.funo.system.action;

import java.util.List;

import com.funo.base.vo.Result;
import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.sysoperatelog.mgmt.ISysOperateLogMgmt;
import com.funo.sysoperatelog.model.SysOperateLog;
import com.funo.sysoperatelog.model.SysOperateLogQueryObj;
import com.funo.system.model.SysOperator;

public class SysOperateLogAction extends CommonAction{
	private ISysOperateLogMgmt sysOperateLogMgmt;

	public ISysOperateLogMgmt getSysOperateLogMgmt() {
		return sysOperateLogMgmt;
	}
	public void setSysOperateLogMgmt(ISysOperateLogMgmt sysOperateLogMgmt) {
		this.sysOperateLogMgmt = sysOperateLogMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysOperateLog(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOperateLogMgmt.querySysOperateLog(new SysOperateLog());
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
	public ActionResult getSysOperateLogList(SysOperateLog sysOperateLog){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOperateLogMgmt.querySysOperateLog(sysOperateLog);
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
	 * 根据条件分页获取小区配置列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult pageQuerySysOperateLog(SysOperateLogQueryObj qSysOperateLog){
		ActionResult ar=new ActionResult();
		Result<SysOperateLog> result=null;
		try {
			result = sysOperateLogMgmt.pageQuerySysOperateLog(qSysOperateLog);
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
	 * 创建
	 */
	public ActionResult createSysOperateLog(SysOperateLog sysOperateLog){
		ActionResult ar=new ActionResult();
		try {
			sysOperateLog.setUnid(sysOperateLogMgmt.getKey());
			sysOperateLog=sysOperateLogMgmt.createSysOperateLog(sysOperateLog);
			ar.setReturnObject(sysOperateLog);
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
	public ActionResult updateSysOperateLog(SysOperateLog sysOperateLog){
		ActionResult ar=new ActionResult();
		try {
			sysOperateLog=sysOperateLogMgmt.modifySysOperateLog(sysOperateLog);
			ar.setReturnObject(sysOperateLog);
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
	public ActionResult deleteSysOperateLog(SysOperateLog sysOperateLog){
		ActionResult ar=new ActionResult();
		try {
			sysOperateLogMgmt.deleteSysOperateLog(sysOperateLog);
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
	public ActionResult batchDeleteSysOperateLog(List<SysOperateLog> sysOperateLogList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysOperateLogList.size();i++){
				this.deleteSysOperateLog(sysOperateLogList.get(i));
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