package com.funo.system.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.system.mgmt.ISysOperateRoleMgmt;
import com.funo.system.model.SysOperateRole;
import com.funo.system.model.SysOperator;

public class SysOperateRoleAction extends CommonAction{
	private ISysOperateRoleMgmt sysOperateRoleMgmt;

	public ISysOperateRoleMgmt getSysOperateRoleMgmt() {
		return sysOperateRoleMgmt;
	}
	public void setSysOperateRoleMgmt(ISysOperateRoleMgmt sysOperateRoleMgmt) {
		this.sysOperateRoleMgmt = sysOperateRoleMgmt;
	}
	

	/**
	 * 获取所有用户角色
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysOperateRole(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOperateRoleMgmt.querySysOperateRole(new SysOperateRole());
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
	 * 根据条件获取用户角色列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysOperateRoleList(SysOperateRole sysOperateRole){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysOperateRoleMgmt.querySysOperateRole(sysOperateRole);
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
	 * 创建用户角色
	 */
	public ActionResult createSysOperateRole(SysOperateRole sysOperateRole){
		ActionResult ar=new ActionResult();
		try {
			sysOperateRole.setUnid(sysOperateRoleMgmt.getKey());
			sysOperateRole=sysOperateRoleMgmt.createSysOperateRole(sysOperateRole);
			ar.setReturnObject(sysOperateRole);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改用户角色
	 */
	public ActionResult updateSysOperateRole(SysOperateRole sysOperateRole){
		ActionResult ar=new ActionResult();
		try {
			sysOperateRole=sysOperateRoleMgmt.modifySysOperateRole(sysOperateRole);
			ar.setReturnObject(sysOperateRole);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除用户角色
	 */
	public ActionResult deleteSysOperateRole(SysOperateRole sysOperateRole){
		ActionResult ar=new ActionResult();
		try {
			sysOperateRoleMgmt.deleteSysOperateRole(sysOperateRole);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除用户角色
	 */
	public ActionResult batchDeleteSysOperateRole(List<SysOperateRole> sysOperateRoleList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysOperateRoleList.size();i++){
				this.deleteSysOperateRole(sysOperateRoleList.get(i));
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