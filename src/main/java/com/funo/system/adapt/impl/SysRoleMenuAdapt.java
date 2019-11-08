package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysRoleMenuDao;
import com.funo.system.adapt.ISysRoleMenuAdapt;
import com.funo.system.model.SysRoleMenu;

public class SysRoleMenuAdapt extends BaseAdapt implements ISysRoleMenuAdapt {

	private static final long serialVersionUID = 1L;
	private ISysRoleMenuDao sysRoleMenuDao;
	
	public ISysRoleMenuDao getSysRoleMenuDao() {
		return sysRoleMenuDao;
	}

	public void setSysRoleMenuDao(ISysRoleMenuDao sysRoleMenuDao) {
		this.sysRoleMenuDao = sysRoleMenuDao;
	}

	public String getKey() {
		return sysRoleMenuDao.getKey();
	}

	public SysRoleMenu createSysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuDao.create(sysRoleMenu);
		return sysRoleMenu;
	}

	public SysRoleMenu modifySysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuDao.update(sysRoleMenu);
		return sysRoleMenu;
	}

	public void deleteSysRoleMenu(SysRoleMenu sysRoleMenu) {
		sysRoleMenuDao.delete(sysRoleMenu);
	}

	public void batchDeleteSysRoleMenu(List<SysRoleMenu> sysRoleMenuList) {
		sysRoleMenuDao.batchCreate(sysRoleMenuList);
	}

	public SysRoleMenu getSysRoleMenuById(String sysRoleMenuId) {
		return sysRoleMenuDao.getById(sysRoleMenuId);
	}

	public List<SysRoleMenu> querySysRoleMenu(SysRoleMenu sysRoleMenu) {
		return sysRoleMenuDao.queryByArgs(sysRoleMenu);
	}
	
}