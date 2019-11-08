package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysRoleMenuAdapt;
import com.funo.system.mgmt.ISysRoleMenuMgmt;
import com.funo.system.model.SysRoleMenu;

public class SysRoleMenuMgmt extends BaseMgmt implements ISysRoleMenuMgmt {

	private static final long serialVersionUID = 1L;
	private ISysRoleMenuAdapt sysRoleMenuAdapt;
	
	public ISysRoleMenuAdapt getSysRoleMenuAdapt() {
		return sysRoleMenuAdapt;
	}
	public void setSysRoleMenuAdapt(ISysRoleMenuAdapt sysRoleMenuAdapt) {
		this.sysRoleMenuAdapt = sysRoleMenuAdapt;
	}

	public String getKey() {
		return sysRoleMenuAdapt.getKey();
	}

	public SysRoleMenu createSysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuAdapt.createSysRoleMenu(sysRoleMenu);
		return sysRoleMenu;
	}

	public SysRoleMenu modifySysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuAdapt.modifySysRoleMenu(sysRoleMenu);
		return sysRoleMenu;
	}

	public void deleteSysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuAdapt.deleteSysRoleMenu(sysRoleMenu);
	}

	public void batchDeleteSysRoleMenu(List<SysRoleMenu> sysRoleMenuList) {
		sysRoleMenuAdapt.batchDeleteSysRoleMenu(sysRoleMenuList);
	}

	public SysRoleMenu getSysRoleMenuById(String sysRoleMenuId) {
		return sysRoleMenuAdapt.getSysRoleMenuById(sysRoleMenuId);
	}

	public List<SysRoleMenu> querySysRoleMenu(SysRoleMenu sysRoleMenu) {
		return sysRoleMenuAdapt.querySysRoleMenu(sysRoleMenu);
	}
	
}