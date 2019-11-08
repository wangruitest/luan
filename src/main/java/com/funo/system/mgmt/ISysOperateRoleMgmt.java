package com.funo.system.mgmt;

import java.util.List;

import com.funo.system.model.SysOperateRole;


public interface ISysOperateRoleMgmt {

	public String getKey();

	public SysOperateRole createSysOperateRole(SysOperateRole sysOperateRole);

	public SysOperateRole modifySysOperateRole(SysOperateRole sysOperateRole);

	public void deleteSysOperateRole(SysOperateRole sysOperateRole);

	public void batchDeleteSysOperateRole(List<SysOperateRole> sysOperateRoleList);

	public SysOperateRole getSysOperateRoleById(String unid);

	public List<SysOperateRole> querySysOperateRole(SysOperateRole sysOperateRole);

}