package com.funo.roleregioncfg.mgmt.impl;

import java.util.Date;
import java.util.List;

import com.funo.base.mgmt.BaseMgmt;
import com.funo.roleregioncfg.adapt.IRoleRegionCfgAdapt;
import com.funo.roleregioncfg.mgmt.IRoleRegionCfgMgmt;
import com.funo.roleregioncfg.model.RoleRegionCfg;

public class RoleRegionCfgMgmt extends BaseMgmt implements IRoleRegionCfgMgmt {

	private static final long serialVersionUID = 1L;
	private IRoleRegionCfgAdapt roleRegionCfgAdapt;
	
	public IRoleRegionCfgAdapt getRoleRegionCfgAdapt() {
		return roleRegionCfgAdapt;
	}
	public void setRoleRegionCfgAdapt(IRoleRegionCfgAdapt roleRegionCfgAdapt) {
		this.roleRegionCfgAdapt = roleRegionCfgAdapt;
	}

	public String getKey() {
		return roleRegionCfgAdapt.getKey();
	}

	public RoleRegionCfg createRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgAdapt.createRoleRegionCfg(roleRegionCfg);
		return roleRegionCfg;
	}

	public void createRoleRegionCfgBatch(String roles,String regions,String createuser){
		String[] rolearray = roles.split(",");
		String[] regionarray = regions.split(",");
		RoleRegionCfg roleRegionCfg=null;
		for (int i=0;i<rolearray.length;i++) {
			roleRegionCfg = new RoleRegionCfg();
			roleRegionCfg.setSysRoleUnid(rolearray[i]);
			roleRegionCfgAdapt.deleteRoleRegionCfg(roleRegionCfg);
			for (int j=0;j<regionarray.length;j++) {
				roleRegionCfg = new RoleRegionCfg();
				String cityid = regionarray[j].substring(0, 3);
				String regionCfgid = regionarray[j].substring(3);
				roleRegionCfg.setCreateDate(new Date());
				roleRegionCfg.setCreateUser(createuser);
				roleRegionCfg.setRegionCfgId(Long.parseLong(regionCfgid));
				roleRegionCfg.setSysRoleUnid(rolearray[i]);
				roleRegionCfg.setCityid(cityid);
				roleRegionCfgAdapt.createRoleRegionCfg(roleRegionCfg);
			}
		}
	}
	
	public RoleRegionCfg modifyRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgAdapt.modifyRoleRegionCfg(roleRegionCfg);
		return roleRegionCfg;
	}

	public void deleteRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgAdapt.deleteRoleRegionCfg(roleRegionCfg);
	}

	public void batchDeleteRoleRegionCfg(List<RoleRegionCfg> roleRegionCfgList) {
		roleRegionCfgAdapt.batchDeleteRoleRegionCfg(roleRegionCfgList);
	}

	public RoleRegionCfg getRoleRegionCfgById(String roleRegionCfgId) {
		return roleRegionCfgAdapt.getRoleRegionCfgById(roleRegionCfgId);
	}

	public List<RoleRegionCfg> queryRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		return roleRegionCfgAdapt.queryRoleRegionCfg(roleRegionCfg);
	}
	
	public List<RoleRegionCfg> queryRoleRegionCityCfg(RoleRegionCfg roleRegionCfg) {
		return roleRegionCfgAdapt.queryRoleRegionCityCfg(roleRegionCfg);
	}
	
}