package com.funo.system.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
 
import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.system.mgmt.ISysRoleMenuMgmt;
import com.funo.system.mgmt.ISysRoleMgmt;
import com.funo.system.model.SysRole;
import com.funo.system.model.SysOperator;
import com.funo.system.model.SysRoleMenu;

public class SysRoleAction extends CommonAction{
	private ISysRoleMgmt sysRoleMgmt;
	
	private ISysRoleMenuMgmt sysRoleMenuMgmt;

	public ISysRoleMgmt getSysRoleMgmt() {
		return sysRoleMgmt;
	}
	public void setSysRoleMgmt(ISysRoleMgmt sysRoleMgmt) {
		this.sysRoleMgmt = sysRoleMgmt;
	}
	public ISysRoleMenuMgmt getSysRoleMenuMgmt() {
		return sysRoleMenuMgmt;
	}
	public void setSysRoleMenuMgmt(ISysRoleMenuMgmt sysRoleMenuMgmt) {
		this.sysRoleMenuMgmt = sysRoleMenuMgmt;
	}
	/**
	 * 获取所有
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllSysRole(){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysRoleMgmt.querySysRole(new SysRole());
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
	// 授权完后sysRole为空，此处保存上次的sysRole
	private SysRole lastSysRole =null;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysRoleList(SysRole sysRole){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			StringBuffer param_sql = new StringBuffer();
			for (SysRole role:getSessionUser().getRoles()) {
				param_sql.append(",'").append(role.getUnid()).append("'");
			}
			if (sysRole!=null) {
				lastSysRole=sysRole;
			}else{
				sysRole=(lastSysRole==null?new SysRole():lastSysRole);
			} 
			
			sysRole.setParam_sql(param_sql.substring(1));
			result = sysRoleMgmt.querySysRole(sysRole);
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
	public ActionResult getSysRolesByCurUser(){
		SysOperator user=getSessionUser();
		
		return getSysRolesByUser(user);
	}
	/**
	 * 获取当前用户权限范围内的菜单
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getSysRolesByUser(SysOperator user){
		ActionResult ar=new ActionResult();
		List result=null;
		try {
			result = sysRoleMgmt.queryByCurUser(user);
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
	public ActionResult createSysRole(SysRole sysRole){
		ActionResult ar=new ActionResult();
		try {
			sysRole.setUnid(sysRoleMgmt.getKey());
			sysRole.setParent_unid(getSessionUser().getRoles().get(0).getUnid());
			sysRole=sysRoleMgmt.createSysRole(sysRole);
			ar.setReturnObject(sysRole);
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
	public ActionResult updateSysRole(SysRole sysRole){
		ActionResult ar=new ActionResult();
		try {
			sysRole=sysRoleMgmt.modifySysRole(sysRole);
			ar.setReturnObject(sysRole);
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
	public ActionResult deleteSysRole(SysRole sysRole){
		ActionResult ar=new ActionResult();
		try {
			sysRoleMgmt.deleteSysRole(sysRole);
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
	public ActionResult batchDeleteSysRole(List<SysRole> sysRoleList){
		ActionResult ar=new ActionResult();
		try {
			for(int i=0;i<sysRoleList.size();i++){
				this.deleteSysRole(sysRoleList.get(i));
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
	 * 角色的菜单授权
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult roleMenuRight(String roleUnids,String menuUnids){
		ActionResult ar=new ActionResult();
		if(StringUtils.isEmpty(menuUnids) || StringUtils.isEmpty(roleUnids)){
			ar.setResultCode(-1);
			ar.setResultMessage("角色标识或菜单标识为空！");
			return ar;
		}
		String[] menuUnidList=menuUnids.split(",");
		String[] roleUnidList=roleUnids.split(",");
		try {
			for (int j = 0; j < roleUnidList.length; j++) {
				//先删除
				SysRoleMenu delSysRoleMenu=new SysRoleMenu();
				delSysRoleMenu.setRoleUnid(roleUnidList[j]);
				sysRoleMenuMgmt.deleteSysRoleMenu(delSysRoleMenu);
				//再创建
				for (int i = 0; i < menuUnidList.length; i++) {
					SysRoleMenu sysRoleMenu=new SysRoleMenu();
					sysRoleMenu.setUnid(sysRoleMenuMgmt.getKey());
					sysRoleMenu.setMenuUnid(menuUnidList[i]);
					sysRoleMenu.setRoleUnid(roleUnidList[j]);
					sysRoleMenuMgmt.createSysRoleMenu(sysRoleMenu);
				}
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