package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysMenuAdapt;
import com.funo.system.mgmt.ISysMenuMgmt;
import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;

public class SysMenuMgmt extends BaseMgmt implements ISysMenuMgmt {

	private static final long serialVersionUID = 1L;
	private ISysMenuAdapt sysMenuAdapt;
	
	public ISysMenuAdapt getSysMenuAdapt() {
		return sysMenuAdapt;
	}
	public void setSysMenuAdapt(ISysMenuAdapt sysMenuAdapt) {
		this.sysMenuAdapt = sysMenuAdapt;
	}

	public String getKey() {
		return sysMenuAdapt.getKey();
	}

	public SysMenu createSysMenu(SysMenu sysMenu) {
		sysMenuAdapt.createSysMenu(sysMenu);
		return sysMenu;
	}

	public SysMenu modifySysMenu(SysMenu sysMenu) {
		sysMenuAdapt.modifySysMenu(sysMenu);
		return sysMenu;
	}

	public void deleteSysMenu(SysMenu sysMenu) {
		sysMenuAdapt.deleteSysMenu(sysMenu);
	}

	public void batchDeleteSysMenu(List<SysMenu> sysMenuList) {
		sysMenuAdapt.batchDeleteSysMenu(sysMenuList);
	}

	public SysMenu getSysMenuById(String sysMenuId) {
		return sysMenuAdapt.getSysMenuById(sysMenuId);
	}

	public List<SysMenu> querySysMenu(SysMenu sysMenu) {
		return sysMenuAdapt.querySysMenu(sysMenu);
	}
	
	public List<SysMenu> queryByCurUser(SysOperator user) {
		return sysMenuAdapt.queryByCurUser(user);
	}
}