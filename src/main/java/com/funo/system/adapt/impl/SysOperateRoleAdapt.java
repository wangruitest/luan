package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysOperateRoleDao;
import com.funo.system.adapt.ISysOperateRoleAdapt;
import com.funo.system.model.SysOperateRole;

public class SysOperateRoleAdapt extends BaseAdapt implements ISysOperateRoleAdapt {

	private static final long serialVersionUID = 1L;
	private ISysOperateRoleDao sysOperateRoleDao;
	
	public ISysOperateRoleDao getSysOperateRoleDao() {
		return sysOperateRoleDao;
	}

	public void setSysOperateRoleDao(ISysOperateRoleDao sysOperateRoleDao) {
		this.sysOperateRoleDao = sysOperateRoleDao;
	}

	public String getKey() {
		return sysOperateRoleDao.getKey();
	}

	public SysOperateRole createSysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleDao.create(sysOperateRole);
		return sysOperateRole;
	}

	public SysOperateRole modifySysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleDao.update(sysOperateRole);
		return sysOperateRole;
	}

	public void deleteSysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleDao.delete(sysOperateRole);
	}

	public void batchDeleteSysOperateRole(List<SysOperateRole> sysOperateRoleList) {
		sysOperateRoleDao.batchCreate(sysOperateRoleList);
	}

	public SysOperateRole getSysOperateRoleById(String sysOperateRoleId) {
		return sysOperateRoleDao.getById(sysOperateRoleId);
	}

	public List<SysOperateRole> querySysOperateRole(SysOperateRole sysOperateRole) {
		return sysOperateRoleDao.queryByArgs(sysOperateRole);
	}
	
}