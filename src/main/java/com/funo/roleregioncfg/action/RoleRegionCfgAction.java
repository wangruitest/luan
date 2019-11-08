package com.funo.roleregioncfg.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.roleregioncfg.mgmt.IRoleRegionCfgMgmt;
import com.funo.roleregioncfg.model.RoleRegionCfg;
import com.funo.system.model.SysOperator;

public class RoleRegionCfgAction extends CommonAction{
	private IRoleRegionCfgMgmt roleRegionCfgMgmt;

	public IRoleRegionCfgMgmt getRoleRegionCfgMgmt() {
		return roleRegionCfgMgmt;
	}
	public void setRoleRegionCfgMgmt(IRoleRegionCfgMgmt roleRegionCfgMgmt) {
		this.roleRegionCfgMgmt = roleRegionCfgMgmt;
	}
	

	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllRoleRegionCfg(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = roleRegionCfgMgmt.queryRoleRegionCfg(new RoleRegionCfg());
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
	public ActionResult getRoleRegionCfgList(RoleRegionCfg roleRegionCfg){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = roleRegionCfgMgmt.queryRoleRegionCfg(roleRegionCfg);
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
	public ActionResult createRoleRegionCfg(RoleRegionCfg roleRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			roleRegionCfg=roleRegionCfgMgmt.createRoleRegionCfg(roleRegionCfg);
			ar.setReturnObject(roleRegionCfg);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 批量创建
	 */
	public ActionResult createRoleRegionCfgBatch(String roles,String regions){
		ActionResult ar=new ActionResult();
		try {
			roleRegionCfgMgmt.createRoleRegionCfgBatch(roles,regions,this.getSessionUser().getName());
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
	public ActionResult updateRoleRegionCfg(RoleRegionCfg roleRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			roleRegionCfg=roleRegionCfgMgmt.modifyRoleRegionCfg(roleRegionCfg);
			ar.setReturnObject(roleRegionCfg);
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
	public ActionResult deleteRoleRegionCfg(RoleRegionCfg roleRegionCfg){
		ActionResult ar=new ActionResult();
		try {
			roleRegionCfgMgmt.deleteRoleRegionCfg(roleRegionCfg);
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
	public ActionResult batchDeleteRoleRegionCfg(List<RoleRegionCfg> roleRegionCfgList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<roleRegionCfgList.size();i++){
				this.deleteRoleRegionCfg(roleRegionCfgList.get(i));
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