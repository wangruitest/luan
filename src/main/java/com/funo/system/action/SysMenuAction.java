package com.funo.system.action;

import java.util.List;

import com.funo.common.ActionResult;
import com.funo.common.CommonAction;
import com.funo.system.mgmt.ISysMenuMgmt;
import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;

public class SysMenuAction extends CommonAction{
	private ISysMenuMgmt sysMenuMgmt;

	public ISysMenuMgmt getSysMenuMgmt() {
		return sysMenuMgmt;
	}
	public void setSysMenuMgmt(ISysMenuMgmt sysMenuMgmt) {
		this.sysMenuMgmt = sysMenuMgmt;
	}
	

	/**
	 * 获取所有菜单
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysMenu(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			SysMenu sm = new SysMenu();
			sm.setStatus(0L);
			result = sysMenuMgmt.querySysMenu(sm);
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
	 * 根据条件获取菜单列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysMenuList(SysMenu sysMenu){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysMenuMgmt.querySysMenu(sysMenu);
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
	 * 获取当前用户权限范围内的菜单
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysMenusByCurUser(){
		ActionResult ar=new ActionResult();
		SysOperator user=getSessionUser();
		List menus=user.getMenus();
		if(null==menus){
			ar= getSysMenusByUser(user);
		}else{
			ar.setReturnList(menus);
			ar.setResultCode(0);
		}
		return ar;
	}
	/**
	 * 获取当前用户权限范围内的菜单
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysMenusByUser(SysOperator user){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysMenuMgmt.queryByCurUser(user);
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
	 * 创建菜单
	 */
	public ActionResult createSysMenu(SysMenu sysMenu){
		ActionResult ar=new ActionResult();
		try {
			sysMenu.setUnid(sysMenuMgmt.getKey());
			sysMenu=sysMenuMgmt.createSysMenu(sysMenu);
			ar.setReturnObject(sysMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 创建菜单
	 */
	public ActionResult copySysMenu(SysMenu sysMenu){
		ActionResult ar=new ActionResult();
		try {
			sysMenu.setUnid(sysMenuMgmt.getKey());
			sysMenu.setName(sysMenu.getName()+"-复制");
			sysMenu=sysMenuMgmt.createSysMenu(sysMenu);
			ar.setReturnObject(sysMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 修改菜单
	 */
	public ActionResult updateSysMenu(SysMenu sysMenu){
		ActionResult ar=new ActionResult();
		try {
			sysMenu=sysMenuMgmt.modifySysMenu(sysMenu);
			ar.setReturnObject(sysMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	/**
	 * 删除菜单
	 */
	public ActionResult deleteSysMenu(SysMenu sysMenu){
		ActionResult ar=new ActionResult();
		try {
			sysMenuMgmt.deleteSysMenu(sysMenu);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * 批量删除菜单
	 */
	public ActionResult batchDeleteSysMenu(List<SysMenu> sysMenuList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysMenuList.size();i++){
				this.deleteSysMenu(sysMenuList.get(i));
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