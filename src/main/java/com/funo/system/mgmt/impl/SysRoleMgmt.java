package com.funo.system.mgmt.impl;

import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.system.adapt.ISysOperateRoleAdapt;
import com.funo.system.adapt.ISysRoleAdapt;
import com.funo.system.mgmt.ISysRoleMgmt;
import com.funo.system.model.SysOperateRole;
import com.funo.system.model.SysRole;
import com.funo.system.model.SysOperator;

public class SysRoleMgmt extends BaseMgmt implements ISysRoleMgmt {

	private static final long serialVersionUID = 1L;
	private ISysRoleAdapt sysRoleAdapt;
	private ISysOperateRoleAdapt sysOperateRoleAdapt;
	
	public ISysRoleAdapt getSysRoleAdapt() {
		return sysRoleAdapt;
	}
	public void setSysRoleAdapt(ISysRoleAdapt sysRoleAdapt) {
		this.sysRoleAdapt = sysRoleAdapt;
	}

	public String getKey() {
		return sysRoleAdapt.getKey();
	}

	public SysRole createSysRole(SysRole sysRole) {
		List<SysOperator> sysOperates=sysRole.getSysOperators();
		if(null!=sysOperates){
			for (int i = 0; i < sysOperates.size(); i++) {
				SysOperateRole sysOperateRole=new SysOperateRole();
				sysOperateRole.setUnid(getKey());
				sysOperateRole.setOperateUnid(sysOperates.get(i).getUnid());
				sysOperateRole.setRoleUnid(sysRole.getUnid());
				sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
			}
		}
		sysRoleAdapt.createSysRole(sysRole);
		return sysRole;
	}

	public SysRole modifySysRole(SysRole sysRole) {
		//先删除、再新增
		SysOperateRole delSysOperateRole=new SysOperateRole();
		delSysOperateRole.setRoleUnid(sysRole.getUnid());
		sysOperateRoleAdapt.deleteSysOperateRole(delSysOperateRole);
		
		List<SysOperator> sysOperates=sysRole.getSysOperators();
		if(null!=sysOperates){
			for (int i = 0; i < sysOperates.size(); i++) {
				SysOperateRole sysOperateRole=new SysOperateRole();
				sysOperateRole.setUnid(getKey());
				sysOperateRole.setOperateUnid(sysOperates.get(i).getUnid());
				sysOperateRole.setRoleUnid(sysRole.getUnid());
				sysOperateRoleAdapt.createSysOperateRole(sysOperateRole);
			}
		}
		sysRoleAdapt.modifySysRole(sysRole);
		return sysRole;
	}

	public void deleteSysRole(SysRole sysRole) {
		//删除关联关系
		SysOperateRole delSysOperateRole=new SysOperateRole();
		delSysOperateRole.setRoleUnid(sysRole.getUnid());
		sysOperateRoleAdapt.deleteSysOperateRole(delSysOperateRole);
		
		sysRoleAdapt.deleteSysRole(sysRole);
	}

	public void batchDeleteSysRole(List<SysRole> sysRoleList) {
		sysRoleAdapt.batchDeleteSysRole(sysRoleList);
	}

	public SysRole getSysRoleById(String sysRoleId) {
		return sysRoleAdapt.getSysRoleById(sysRoleId);
	}

	public List<SysRole> querySysRole(SysRole sysRole) {
		return sysRoleAdapt.querySysRole(sysRole);
	}
	
	public List<SysRole> queryByCurUser(SysOperator user) {
		return sysRoleAdapt.queryByCurUser(user);
	}
	public ISysOperateRoleAdapt getSysOperateRoleAdapt() {
		return sysOperateRoleAdapt;
	}
	public void setSysOperateRoleAdapt(ISysOperateRoleAdapt sysOperateRoleAdapt) {
		this.sysOperateRoleAdapt = sysOperateRoleAdapt;
	}
	
}