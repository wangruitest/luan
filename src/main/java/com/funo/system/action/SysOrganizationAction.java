package com.funo.system.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.system.mgmt.ISysOrganizationMgmt;
import com.funo.system.model.SysOrganization;
import com.funo.system.model.SysOperator;

public class SysOrganizationAction extends CommonAction{
	private ISysOrganizationMgmt sysOrganizationMgmt;
	public static ISysOrganizationMgmt sysOrganizationMgmtStatic;

	public ISysOrganizationMgmt getSysOrganizationMgmt() {
		return sysOrganizationMgmt;
	}
	public void setSysOrganizationMgmt(ISysOrganizationMgmt sysOrganizationMgmt) {
		this.sysOrganizationMgmt = sysOrganizationMgmt;
		this.sysOrganizationMgmtStatic = sysOrganizationMgmt;
	}
	

	/**
	 * 获取所有组织
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysOrganization(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOrganizationMgmt.querySysOrganization(new SysOrganization());
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
	 * 根据条件获取组织列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysOrganizationList(SysOrganization sysOrganization){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOrganizationMgmt.querySysOrganization(sysOrganization);
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
	 * 创建组织
	 */
	public ActionResult createSysOrganization(SysOrganization sysOrganization){
		ActionResult ar=new ActionResult();
		try {
			sysOrganization.setUnid(sysOrganizationMgmt.getKey());
			sysOrganization=sysOrganizationMgmt.createSysOrganization(sysOrganization);
			ar.setReturnObject(sysOrganization);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改组织
	 */
	public ActionResult updateSysOrganization(SysOrganization sysOrganization){
		ActionResult ar=new ActionResult();
		try {
			sysOrganization=sysOrganizationMgmt.modifySysOrganization(sysOrganization);
			ar.setReturnObject(sysOrganization);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除组织
	 */
	public ActionResult deleteSysOrganization(SysOrganization sysOrganization){
		ActionResult ar=new ActionResult();
		try {
			sysOrganizationMgmt.deleteSysOrganization(sysOrganization);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除组织
	 */
	public ActionResult batchDeleteSysOrganization(List<SysOrganization> sysOrganizationList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysOrganizationList.size();i++){
				this.deleteSysOrganization(sysOrganizationList.get(i));
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