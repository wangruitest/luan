package com.funo.system.adapt;

import java.util.List;

import com.funo.system.model.SysOperateRole;


public interface ISysOperateRoleAdapt {

	public String getKey();

	public SysOperateRole createSysOperateRole(SysOperateRole sysOperateRole);

	public SysOperateRole modifySysOperateRole(SysOperateRole sysOperateRole);

	public void deleteSysOperateRole(SysOperateRole sysOperateRole);

	public void batchDeleteSysOperateRole(List<SysOperateRole> sysOperateRoleList);

	public SysOperateRole getSysOperateRoleById(String unid);

	public List<SysOperateRole> querySysOperateRole(SysOperateRole sysOperateRole);

}