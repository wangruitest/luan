package com.funo.system.mgmt;

import java.util.List;

import com.funo.system.model.SysMenu;
import com.funo.system.model.SysOperator;


public interface ISysMenuMgmt {

	public String getKey();

	public SysMenu createSysMenu(SysMenu sysMenu);

	public SysMenu modifySysMenu(SysMenu sysMenu);

	public void deleteSysMenu(SysMenu sysMenu);

	public void batchDeleteSysMenu(List<SysMenu> sysMenuList);

	public SysMenu getSysMenuById(String unid);

	public List<SysMenu> querySysMenu(SysMenu sysMenu);
	
	public List<SysMenu> queryByCurUser(SysOperator user);

}