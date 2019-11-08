package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysOperateRoleAdapt;
import com.funo.system.mgmt.ISysOperateRoleMgmt;
import com.funo.system.model.SysOperateRole;

public class SysOperateRoleMgmt extends BaseMgmt implements ISysOperateRoleMgmt {

	private static final long serialVersionUID = 1L;
	private ISysOperateRoleAdapt sysOperateRoleAdapt;
	
	public ISysOperateRoleAdapt getSysOperateRoleAdapt() {
		return sysOperateRoleAdapt;
	}
	public void setSysOperateRoleAdapt(ISysOperateRoleAdapt sysOperateRoleAdapt) {
		this.sysOperateRoleAdapt = sysOperateRoleAdapt;
	}

	public String getKey() {
		return sysOperateRoleAdapt.getKey();
	}

	public SysOperateRole createSysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
		return sysOperateRole;
	}

	public SysOperateRole modifySysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleAdapt.modifySysOperateRole(sysOperateRole);
		return sysOperateRole;
	}

	public void deleteSysOperateRole(SysOperateRole sysOperateRole) {
		sysOperateRoleAdapt.deleteSysOperateRole(sysOperateRole);
	}

	public void batchDeleteSysOperateRole(List<SysOperateRole> sysOperateRoleList) {
		sysOperateRoleAdapt.batchDeleteSysOperateRole(sysOperateRoleList);
	}

	public SysOperateRole getSysOperateRoleById(String sysOperateRoleId) {
		return sysOperateRoleAdapt.getSysOperateRoleById(sysOperateRoleId);
	}

	public List<SysOperateRole> querySysOperateRole(SysOperateRole sysOperateRole) {
		return sysOperateRoleAdapt.querySysOperateRole(sysOperateRole);
	}
	
}