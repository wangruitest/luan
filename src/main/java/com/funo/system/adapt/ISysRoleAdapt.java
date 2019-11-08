package com.funo.system.adapt;

import java.util.List;

import com.funo.system.model.SysRole;
import com.funo.system.model.SysOperator;


public interface ISysRoleAdapt {

	public String getKey();

	public SysRole createSysRole(SysRole sysRole);

	public SysRole modifySysRole(SysRole sysRole);

	public void deleteSysRole(SysRole sysRole);

	public void batchDeleteSysRole(List<SysRole> sysRoleList);

	public SysRole getSysRoleById(String unid);

	public List<SysRole> querySysRole(SysRole sysRole);

	public List<SysRole> queryByCurUser(SysOperator user);
}