package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysRoleDao;
import com.funo.system.adapt.ISysRoleAdapt;
import com.funo.system.model.SysRole;
import com.funo.system.model.SysOperator;

public class SysRoleAdapt extends BaseAdapt implements ISysRoleAdapt {

	private static final long serialVersionUID = 1L;
	private ISysRoleDao sysRoleDao;
	
	public ISysRoleDao getSysRoleDao() {
		return sysRoleDao;
	}

	public void setSysRoleDao(ISysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
	}

	public String getKey() {
		return sysRoleDao.getKey();
	}

	public SysRole createSysRole(SysRole sysRole) {
		sysRoleDao.create(sysRole);
		return sysRole;
	}

	public SysRole modifySysRole(SysRole sysRole) {
		sysRoleDao.update(sysRole);
		return sysRole;
	}

	public void deleteSysRole(SysRole sysRole) {
		sysRoleDao.delete(sysRole);
	}

	public void batchDeleteSysRole(List<SysRole> sysRoleList) {
		sysRoleDao.batchCreate(sysRoleList);
	}

	public SysRole getSysRoleById(String sysRoleId) {
		return sysRoleDao.getById(sysRoleId);
	}

	public List<SysRole> querySysRole(SysRole sysRole) {
		return sysRoleDao.queryByArgs(sysRole);
	}
	
	public List<SysRole> queryByCurUser(SysOperator user) {
		return sysRoleDao.queryByCurUser(user);
	}
	
	
}