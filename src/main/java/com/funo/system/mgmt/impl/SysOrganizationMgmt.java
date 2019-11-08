package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysOrganizationAdapt;
import com.funo.system.mgmt.ISysOrganizationMgmt;
import com.funo.system.model.SysOrganization;

public class SysOrganizationMgmt extends BaseMgmt implements ISysOrganizationMgmt {

	private static final long serialVersionUID = 1L;
	private ISysOrganizationAdapt sysOrganizationAdapt;
	
	public ISysOrganizationAdapt getSysOrganizationAdapt() {
		return sysOrganizationAdapt;
	}
	public void setSysOrganizationAdapt(ISysOrganizationAdapt sysOrganizationAdapt) {
		this.sysOrganizationAdapt = sysOrganizationAdapt;
	}

	public String getKey() {
		return sysOrganizationAdapt.getKey();
	}

	public SysOrganization createSysOrganization(SysOrganization sysOrganization) {
		sysOrganizationAdapt.createSysOrganization(sysOrganization);
		return sysOrganization;
	}

	public SysOrganization modifySysOrganization(SysOrganization sysOrganization) {
		sysOrganizationAdapt.modifySysOrganization(sysOrganization);
		return sysOrganization;
	}

	public void deleteSysOrganization(SysOrganization sysOrganization) {
		sysOrganizationAdapt.deleteSysOrganization(sysOrganization);
	}

	public void batchDeleteSysOrganization(List<SysOrganization> sysOrganizationList) {
		sysOrganizationAdapt.batchDeleteSysOrganization(sysOrganizationList);
	}

	public SysOrganization getSysOrganizationById(String sysOrganizationId) {
		return sysOrganizationAdapt.getSysOrganizationById(sysOrganizationId);
	}

	public List<SysOrganization> querySysOrganization(SysOrganization sysOrganization) {
		return sysOrganizationAdapt.querySysOrganization(sysOrganization);
	}
	
}