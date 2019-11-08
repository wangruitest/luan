package com.funo.system.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.system.dao.ISysOrganizationDao;
import com.funo.system.adapt.ISysOrganizationAdapt;
import com.funo.system.model.SysOrganization;

public class SysOrganizationAdapt extends BaseAdapt implements ISysOrganizationAdapt {

	private static final long serialVersionUID = 1L;
	private ISysOrganizationDao sysOrganizationDao;
	
	public ISysOrganizationDao getSysOrganizationDao() {
		return sysOrganizationDao;
	}

	public void setSysOrganizationDao(ISysOrganizationDao sysOrganizationDao) {
		this.sysOrganizationDao = sysOrganizationDao;
	}

	public String getKey() {
		return sysOrganizationDao.getKey();
	}

	public SysOrganization createSysOrganization(SysOrganization sysOrganization) {
		sysOrganizationDao.create(sysOrganization);
		return sysOrganization;
	}

	public SysOrganization modifySysOrganization(SysOrganization sysOrganization) {
		sysOrganizationDao.update(sysOrganization);
		return sysOrganization;
	}

	public void deleteSysOrganization(SysOrganization sysOrganization) {
		sysOrganizationDao.delete(sysOrganization);
	}

	public void batchDeleteSysOrganization(List<SysOrganization> sysOrganizationList) {
		sysOrganizationDao.batchCreate(sysOrganizationList);
	}

	public SysOrganization getSysOrganizationById(String sysOrganizationId) {
		return sysOrganizationDao.getById(sysOrganizationId);
	}

	public List<SysOrganization> querySysOrganization(SysOrganization sysOrganization) {
		return sysOrganizationDao.queryByArgs(sysOrganization);
	}
	
}