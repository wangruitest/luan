package com.funo.monitor.action;

import java.util.List;
 
import com.funo.base.vo.Result;
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.monitor.mgmt.IMonitorMgmt;
import com.funo.monitor.model.Monitor;
import com.funo.monitor.model.MonitorQueryObj;
import com.funo.system.model.SysOperator;

public class MonitorAction extends CommonAction{
	private IMonitorMgmt monitorMgmt;

	public IMonitorMgmt getMonitorMgmt() {
		return monitorMgmt;
	}
	public void setMonitorMgmt(IMonitorMgmt monitorMgmt) {
		this.monitorMgmt = monitorMgmt;
	}
	

	/**
	 * 获取所有系统日志
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllMonitor(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = monitorMgmt.queryMonitor(new Monitor());
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
	 * 根据条件获取系统日志列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getMonitorList(Monitor monitor){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = monitorMgmt.queryMonitor(monitor);
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
	 * 创建系统日志
	 */
	public ActionResult createMonitor(Monitor monitor){
		ActionResult ar=new ActionResult();
		try {
			monitor=monitorMgmt.createMonitor(monitor);
			ar.setReturnObject(monitor);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改系统日志
	 */
	public ActionResult updateMonitor(Monitor monitor){
		ActionResult ar=new ActionResult();
		try {
			monitor=monitorMgmt.modifyMonitor(monitor);
			ar.setReturnObject(monitor);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除系统日志
	 */
	public ActionResult deleteMonitor(Monitor monitor){
		ActionResult ar=new ActionResult();
		try {
			monitorMgmt.deleteMonitor(monitor);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除系统日志
	 */
	public ActionResult batchDeleteMonitor(List<Monitor> monitorList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<monitorList.size();i++){
				this.deleteMonitor(monitorList.get(i));
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
	
	/**
	 * 根据条件分页获取系统日志列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult pageQueryMonitor(MonitorQueryObj qMonitor){
		ActionResult ar=new ActionResult();
		Result<Monitor> result=null;
		try {
			result = monitorMgmt.pageQueryMonitor(qMonitor);
			ar.setReturnObject(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
}