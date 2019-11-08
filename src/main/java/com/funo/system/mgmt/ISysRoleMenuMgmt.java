package com.funo.system.mgmt;

import java.util.List;

import com.funo.system.model.SysRoleMenu;


public interface ISysRoleMenuMgmt {

	public String getKey();

	public SysRoleMenu createSysRoleMenu(SysRoleMenu sysRoleMenu);

	public SysRoleMenu modifySysRoleMenu(SysRoleMenu sysRoleMenu);

	public void deleteSysRoleMenu(SysRoleMenu sysRoleMenu);

	public void batchDeleteSysRoleMenu(List<SysRoleMenu> sysRoleMenuList);

	public SysRoleMenu getSysRoleMenuById(String unid);

	public List<SysRoleMenu> querySysRoleMenu(SysRoleMenu sysRoleMenu);

}