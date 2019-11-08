package com.funo.system.mgmt;

import java.util.List;

import com.funo.system.model.SysOrganization;


public interface ISysOrganizationMgmt {

	public String getKey();

	public SysOrganization createSysOrganization(SysOrganization sysOrganization);

	public SysOrganization modifySysOrganization(SysOrganization sysOrganization);

	public void deleteSysOrganization(SysOrganization sysOrganization);

	public void batchDeleteSysOrganization(List<SysOrganization> sysOrganizationList);

	public SysOrganization getSysOrganizationById(String unid);

	public List<SysOrganization> querySysOrganization(SysOrganization sysOrganization);

}