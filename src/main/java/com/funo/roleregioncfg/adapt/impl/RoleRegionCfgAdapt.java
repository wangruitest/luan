package com.funo.roleregioncfg.adapt.impl;

import java.util.List;

import com.funo.base.adapt.BaseAdapt;
import com.funo.roleregioncfg.dao.IRoleRegionCfgDao;
import com.funo.roleregioncfg.adapt.IRoleRegionCfgAdapt;
import com.funo.roleregioncfg.model.RoleRegionCfg;

public class RoleRegionCfgAdapt extends BaseAdapt implements IRoleRegionCfgAdapt {

	private static final long serialVersionUID = 1L;
	private IRoleRegionCfgDao roleRegionCfgDao;
	
	public IRoleRegionCfgDao getRoleRegionCfgDao() {
		return roleRegionCfgDao;
	}

	public void setRoleRegionCfgDao(IRoleRegionCfgDao roleRegionCfgDao) {
		this.roleRegionCfgDao = roleRegionCfgDao;
	}

	public String getKey() {
		return roleRegionCfgDao.getKey();
	}

	public RoleRegionCfg createRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgDao.create(roleRegionCfg);
		return roleRegionCfg;
	}

	public RoleRegionCfg modifyRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgDao.update(roleRegionCfg);
		return roleRegionCfg;
	}

	public void deleteRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		roleRegionCfgDao.delete(roleRegionCfg);
	}

	public void batchDeleteRoleRegionCfg(List<RoleRegionCfg> roleRegionCfgList) {
		roleRegionCfgDao.batchCreate(roleRegionCfgList);
	}

	public RoleRegionCfg getRoleRegionCfgById(String roleRegionCfgId) {
		return roleRegionCfgDao.getById(roleRegionCfgId);
	}

	public List<RoleRegionCfg> queryRoleRegionCfg(RoleRegionCfg roleRegionCfg) {
		return roleRegionCfgDao.queryByArgs(roleRegionCfg);
	}
	
	public List<RoleRegionCfg> queryRoleRegionCityCfg(RoleRegionCfg roleRegionCfg) {
		return roleRegionCfgDao.queryByRegionForCity(roleRegionCfg);
	}
	
}