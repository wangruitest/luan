package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysMenuDao;
import com.funo.system.adapt.ISysMenuAdapt;
import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;

public class SysMenuAdapt extends BaseAdapt implements ISysMenuAdapt {

	private static final long serialVersionUID = 1L;
	private ISysMenuDao sysMenuDao;
	
	public ISysMenuDao getSysMenuDao() {
		return sysMenuDao;
	}

	public void setSysMenuDao(ISysMenuDao sysMenuDao) {
		this.sysMenuDao = sysMenuDao;
	}

	public String getKey() {
		return sysMenuDao.getKey();
	}

	public SysMenu createSysMenu(SysMenu sysMenu) {
		sysMenuDao.create(sysMenu);
		return sysMenu;
	}

	public SysMenu modifySysMenu(SysMenu sysMenu) {
		sysMenuDao.update(sysMenu);
		return sysMenu;
	}

	public void deleteSysMenu(SysMenu sysMenu) {
		sysMenuDao.delete(sysMenu);
	}

	public void batchDeleteSysMenu(List<SysMenu> sysMenuList) {
		sysMenuDao.batchCreate(sysMenuList);
	}

	public SysMenu getSysMenuById(String sysMenuId) {
		return sysMenuDao.getById(sysMenuId);
	}

	public List<SysMenu> querySysMenu(SysMenu sysMenu) {
		return sysMenuDao.queryByArgs(sysMenu);
	}
	
	public List<SysMenu> queryByCurUser(SysOperator user) {
		return sysMenuDao.queryByCurUser(user);
	}
}