package com.funo.system.action;

import java.util.List;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.system.mgmt.ISysRoleMenuMgmt;
import com.funo.system.model.SysRoleMenu;
import com.funo.system.model.SysOperator;

public class SysRoleMenuAction extends CommonAction{
	private ISysRoleMenuMgmt sysRoleMenuMgmt;

	public ISysRoleMenuMgmt getSysRoleMenuMgmt() {
		return sysRoleMenuMgmt;
	}
	public void setSysRoleMenuMgmt(ISysRoleMenuMgmt sysRoleMenuMgmt) {
		this.sysRoleMenuMgmt = sysRoleMenuMgmt;
	}
	

	/**
	 * 获取所有角色菜单
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysRoleMenu(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysRoleMenuMgmt.querySysRoleMenu(new SysRoleMenu());
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
	 * 根据条件获取角色菜单列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysRoleMenuList(SysRoleMenu sysRoleMenu){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysRoleMenuMgmt.querySysRoleMenu(sysRoleMenu);
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
	 * 创建角色菜单
	 */
	public ActionResult createSysRoleMenu(SysRoleMenu sysRoleMenu){
		ActionResult ar=new ActionResult();
		try {
			sysRoleMenu.setUnid(sysRoleMenuMgmt.getKey());
			sysRoleMenu=sysRoleMenuMgmt.createSysRoleMenu(sysRoleMenu);
			ar.setReturnObject(sysRoleMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改角色菜单
	 */
	public ActionResult updateSysRoleMenu(SysRoleMenu sysRoleMenu){
		ActionResult ar=new ActionResult();
		try {
			sysRoleMenu=sysRoleMenuMgmt.modifySysRoleMenu(sysRoleMenu);
			ar.setReturnObject(sysRoleMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除角色菜单
	 */
	public ActionResult deleteSysRoleMenu(SysRoleMenu sysRoleMenu){
		ActionResult ar=new ActionResult();
		try {
			sysRoleMenuMgmt.deleteSysRoleMenu(sysRoleMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除角色菜单
	 */
	public ActionResult batchDeleteSysRoleMenu(List<SysRoleMenu> sysRoleMenuList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysRoleMenuList.size();i++){
				this.deleteSysRoleMenu(sysRoleMenuList.get(i));
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